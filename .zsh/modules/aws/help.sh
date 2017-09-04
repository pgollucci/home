# ============================================================================
#  Wrappers for the AWS CLI. Unix only. Windows support will not be added.
#  It needs to be installed and the aws binary in your $PATH
#  This is the default with mac brew and linux rpms/yum/apt...
#
#  Note, you need to have a valid and active STS token prior to calling any of these.
#  See stratos/stratosphere-sts which is bundled with stratosphere for how to get
#  STS tokens.
#
#  You must have pyenv setup and a python from it in your PATH.
#  System python will not be supported.  Do not ask about 'sudo'
#  See `make pyenv`
#
#  You also need a working proxy setup that works from your shell
#  which strosphere will bootstrap for you via `make myproxy`
#
# ============================================================================

##############################################################################
#
# Given a
#   StackName, ASV, User/Email, EnvCode, CFT file, TagsFlag, Name, CustomTags
#   0 or more key=val pairs
# Make and run a CFT in AWS Region with StackName which may or may not
# use the fields as tags or something else.
#
# If stack with name exists update without delete on fail else create and delete on fail.
# Only stacks in a success state will be updated.  If debug, stack will not rollback on fail.
#
# In short this wraps the aws cloudformation create-stack|update-stack
#
# Args:
#   name      - stack-name
#   app       - asvname i.e. for asvfrank then frank results in Tag ASV value ASVfrank
#   user      - Value for Tag OwnerContact i.e. abc123 or #sprint-team@capitalone.com
#   env_code  - Value for Tag CMDBEnvironment i.e PP results in ENVPPfrank (app from above)
#   template  - full path to CFT .json file (eventually this will be an s3:// path)
#   std_tags  - std_tags or anything else (see docs for aws_build_parmas)
#   tag_name  - if present and not '--' additional Tag Name is available and will be used as a prefix for
#               names of reources created
#   custom_tags - if present add thse tags to resources
#
#   0 or more key=value pairs which will be sent as input parameters to the CFT
#               (supports mutli-value, and repeat names (last one wins))
#
# Output:
# json - { StackId: "id" }
#   same as the direct cli call
#
##############################################################################
aws_stack_make() {
  local name="$1"
  local app="$2"
  local user="$3"
  local env_code="$4"
  local template_dirs="$5"
  local template="$6"
  local std_tags="$7"
  local tag_name="$8"
  local custom_tags="$9"
  shift 9

  local tags=$(aws_build_common_params "${nl}" "cloudformation" "${app}" "${owner_contact}" "${env_code}" "${std_tags}" "${tag_name}" "${custom_tags}")

  local params=$(aws_build_params "${name}" "${app}" "${user}" "${env_code}" "${std_tags}" "${tag_name}" "${custom_tags}" "$@")
  params="$params$nl"

  local action=
  local onfail=
  local stackstatus=$(aws_stack_status "${name}")

  if [ -n "${DEBUG}" ]; then
      case $stackstatus in
	  *FAILED*|*ROLLBACK*)
	      aws_stack_delete "${name}"
	      aws_stack_ensure_dne "${name}"
	      stackstatus=
	      ;;
      esac
  fi

  case $stackstatus in
    "") action=create-stack onfail="--on-failure DELETE" ;;
    *) action=update-stack onfail="" ;;
  esac

  [ -n "${DEBUG}" ] && onfail=""

  local tmpl_file=$(file_cascade "${template}" "" ${template_dirs})

  cond_run aws \
      cloudformation ${action} \
      ${onfail} \
      --stack-name "$name" \
      --template-body file://${tmpl_file} \
      --tags ${tags} \
      --parameters ${params} 2>&1
}

##############################################################################
#
# Deletes an AWS Stack with stack as name.
# stack delete may fail if a non empty s3 bucket is made in it.
#
# Args:
#   stack     - name of stack to delete
#
# Output:
#   matches cli exactly
#
##############################################################################
aws_stack_delete() {
    local stack="$1"

    cond_run aws cloudformation delete-stack --stack-name "${stack}"
}

##############################################################################
#
# Wraps aws cloudformation describe-stacks and lists
# stacks which start with a stack-name prefix of name.
#
# Args:
#   stack_glob   - glob that stack-name must contain
#
# Output:
#   stack-name sorted descending by creation-time.
#
##############################################################################
aws_stacks_list() {
    local stack_glob="$1"

    aws --output text cloudformation describe-stacks --query "Stacks[*].[StackName, CreationTime]" | \
	sort -k 1,1 -nr | awk -v k=${stack_glob} '$1 ~ k { print $1 }'
}

##############################################################################
#
# Leverage aws_stack_describe() to return the stack status
#
# Args:
#   stack      - stack-name to return status of
#
# Output:
#   stack's status
#
##############################################################################
aws_stack_status() {
    local stack="$1"

    aws_stack_describe "${stack}" "Stacks[0].StackStatus"
}

##############################################################################
#
# Wraps aws cloudformation describe-stacks and tells you about a stack
#  with optional jmes query path.
#
# Args:
#   stack      - name of stack to delete
#   jmespath   - optional: jmes path to extract
#
# Output:
#  depends on jmespath
#  text if no jmespath, json if jmespath
#
##############################################################################
aws_stack_describe() {
    local stack="$1"
    local jmespath="$2"

    if [ -n "${jmespath}" ]; then
	aws --output text cloudformation describe-stacks --stack-name "${stack}" --query "${jmespath}"
    else
	aws --output text cloudformation describe-stacks --stack-name "${stack}"
    fi
}

##############################################################################
#
# Blocks until stack with name is in state CREATE_COMPLETE or UPDATE_COMPLETE.
# Uses a doubling back off test, retry approach.
#
# ** Function will exit if stack moves to fail state ROLLBACK_COMPLETE **
#
# Args:
#   name       - name of stack
#
# Output:
#   waiting status if any
#
##############################################################################
aws_stack_wait_for() {
  local name="$1"

  [ -n "${DRY_RUN}" ] && return

  local i=1
  while [ : ]; do
      local status=$(aws_stack_describe "${name}" "Stacks[0].StackStatus")

      [ x"$status" = x"CREATE_COMPLETE" -o x"$status" = x"UPDATE_COMPLETE" -o x"$status" = x"UPDATE_ROLLBACK_COMPLETE" ] && break
      [ x"$status" = x"ROLLBACK_COMPLETE" ] && exit 15

      log "Waiting for ${name}: $i seconds"
      i=$(doubling_backoff_retry $i)
  done
}

##############################################################################
#
# Blocks until stack with name DNE
# Uses a doubling back off test, retry approach.
#
# Args:
#   name       - name of stack
#
# Output:
#   waiting status if any
#
##############################################################################
aws_stack_ensure_dne() {
  local name="$1"

  [ -n "${DRY_RUN}" ] && return

  local i=1
  while [ : ]; do
      local status=$(aws_stack_describe "${name}" "Stacks[0].StackStatus")

      [ -z "$status" ] && break

      log "Waiting for ${name} to vanish: $i seconds"
      i=$(doubling_backoff_retry $i)
  done
}

##############################################################################
#
# Given a name and optional jmes path return the stack output
# variable asked for.  By default the 0th one.
#
# Args:
#   name       - stack-name to lookup output var for
#   jmespath   - optional: Stacks[0].Outputs[0].OutputValue
#                  index is 0 based, outputs index goes up by 1 for
#                  subsequent output variables
#
# Leverages aws_stack_describe()
#
# Output:
#  stack output variable value
#
# Use me to chain CFTs together. CFT should be seperated based on likely
# frequency of change of the stack's resources.
# i.e. [vpc < subnet <] sg < sns < s3 < app(elb,ec2)  < rds < dns
#
##############################################################################
aws_stack_output_query() {
  local name="$1"
  local jmespath="${2:-Stacks[0].Outputs[0].OutputValue}"

  aws_stack_describe "${name}" "${jmespath}"
}

##############################################################################
#
# Given a stack name and stack output variable name
# return it.
#
# Args:
#   name       - stack-name to lookup output var for
#   var        - name of output variable
#
# Output:
#  stack output variable value for var
#
# Use me to chain CFTs together. CFT should be seperated based on likely
# frequency of change of the stack's resources.
# i.e. [vpc < subnet <] sg < sns < s3 < app(elb,ec2)  < rds < dns
#
##############################################################################
aws_stack_output_query_by_name() {
  local name="$1"
  local var="$2"

  aws  --output text cloudformation describe-stacks --stack-name ${name} --query "Stacks[].Outputs[?OutputKey==\`$var\`].OutputValue"
}

##############################################################################
#
# Subscribes subs to sns_topic
#
# Args:
#   sns_topic - sns topic name
#   subs      - space sep list of e-mails
#
# Output:
#
##############################################################################
aws_sns_subscribe() {
    local sns_topic="$1"
    local subs="$2"

    local sub
    for sub in $subs; do
	cond_run aws sns subscribe --topic-arn $sns_topic --protocol email --notification-endpoint $sub
    done
}

##############################################################################
#
# uploads a directory (src) to s3 bucket (dst_bucket) and folder (dst_folder)
#  in that bucket using SSE-KMS with c1 keys.
#
# Exactly wraps s3 sync but also sets --sse AES256
#
# Args:
#   src        - path to dir locally
#   dst_bucket - s3 bucket name (not arn)
#   dst_folder - folder name (doesn't need to the smae as src)
#   kms_s3_arn - arn to kms s3 key [c1 not aws]
#   extra_args - additional optional options (i.e. include/exclude)
#
# Output:
#   s3 sync output
#
##############################################################################
aws_s3_sync() {
    local src="$1"
    local dst_bucket="$2"
    local dst_folder="$3"
    local kms_s3_arn="$4"
    shift 4

    local enc=
    case $kms_s3_arn in
	arn:aws:kms:) enc="--sse aws:kms --sse-kms-key-id $kms_s3_arn" ;;
	*) enc="--sse AES256"
    esac

    cond_run aws s3 sync $enc ${src} s3://${dst_bucket}/${dst_folder} "$@"
}

##############################################################################
#
# copies a file (src) to s3 bucket (dst_bucket) and folder (dst_folder)
#  in that bucket.
#
# Exactly wraps s3 cp but also sets --sse AES256 or aws:kms
#
# Args:
#   src        - path to dir locally
#   dst_bucket - s3 bucket name (not arn)
#   dst_folder - folder name (doesn't need to the smae as src)
#   kms_s3_arn - full arn for the s3 kms key when using aws:kms or S3-KMS
#   dne_flag   - if dne, then only copy if src is not already in dst_bucket/dst_folder
#
# Output
#   s3 cp output
#
##############################################################################
aws_s3_cp() {
    local src="$1"
    local dst_bucket="$2"
    local dst_folder="$3"
    local kms_s3_arn="$4"
    local dne_flag="$5"

    local enc=
    case $kms_s3_arn in
	arn:aws:kms:) enc="--sse aws:kms --sse-kms-key-id $kms_s3_arn" ;;
	*) enc="--sse AES256"
    esac

    local rc=1
    if [ -n "${dne_flag}" ]; then
	aws s3 ls s3://${dst_bucket}/${dst_folder}/$(basename $src) >/dev/null
	rc=$?
    fi

    if [ $rc -eq 1 ]; then
	cond_run aws s3 cp $enc  ${src} s3://${dst_bucket}/${dst_folder}/
    fi
}

##############################################################################
#
# Removes a s3 bucket even if non empty
# (think functional/integration testing cleanup or cleaning up after yourself)
#
# Args:
#   s3uri      - s3://bucket-name
#
# Output:
#  s3 rb output
#
##############################################################################
aws_s3_rb() {
    local s3uri="$1"

    cond_run aws s3 rb s3://${s3uri} --force
}

##############################################################################
#
# Makes an EC2 key pair with name.  Saves private piece in
# dir
# If key exists in AWS
#   if private piece dne locally
#      delete in AWS
#      make key in AWS, save private locally
# else
#      make key in AWS, save private locally
#
# Note, other software relies on this path for keys.  Do not move.
#
# This function should not be called outside of Dev, QA.
#
# Args:
#   name       - name of key to make
#   dir        - folder to save private half of key in
#
# Output
#   None
#
##############################################################################
aws_ec2_keypair_make() {
  local dir="$1"
  local name="$2"

  aws ec2 describe-key-pairs --key-name "${name}" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
      if [ ! -f ${dir}/${name} ]; then
	  aws ec2 delete-key-pair --key-name "${name}" 2>&1 >/dev/null
	  [ -d ${dir} ] || mkdir -p ${dir}
	  aws ec2 create-key-pair --key-name "${name}" --query KeyMaterial | perl -p -e 's,",,g ; s,\\n,\n,g' > ${dir}/${name}
      fi
  else
      aws ec2 create-key-pair --key-name "${name}" --query KeyMaterial | perl -p -e 's,",,g ; s,\\n,\n,g' > ${dir}/${name}
  fi
}

##############################################################################
#
# Deletes an EC2 key pair with name.  Removes private peice in
# ~/.ssh/dynamic/name.
#
# This function should not be called outside of Dev, QA.
#
# Args:
#   dir        - folder to save private half of key in
#   name       - name of key to make
#
##############################################################################
aws_ec2_keypair_del() {
  local dir="$1"
  local name="$2"

  aws ec2 delete-key-pair --key-name "${name}"
  rm -f ${dir}/${name}
}

##############################################################################
#
# Terminate Ec2 w/ given instance_id
#
# Args:
#   instance_id - ec2 instance id i-
#
# Output:
#   json
#
# N.B.
#   termination protection
#   IAM perms
#   Data on Root EBS (or auto cleaned up aux EBS)
#   ASG respawns
#
##############################################################################
aws_ec2_instance_terminate() {
    local instance_id="$1"

    cond_run aws ec2 terminate-instances --instance-id $instance_id
}

##############################################################################
#
# Given a name tag find the newest matching instance and output the instance-id
#
# Args:
#   name       - name tag
#
# Output:
#   instance-id
#
##############################################################################
aws_ec2_instance_id_from_name_tag() {
  local name="$1"

  aws --output text ec2 \
      describe-instances --filters Name=tag:Name,Values="$name" \
      --query 'Reservations[].Instances[].[LaunchTime,InstanceId]' | \
      sort -n | awk '{ print $2 }' | tail -1
}

##############################################################################
#
# Given an instance_id output the private ip address
#
# This function should not be called outside of Retailbank, Dev, QA.
#
# Args:
#   instance_id - ec2 instance-id
#
# Output:
#   ipaddr
#
##############################################################################
aws_ec2_private_ip() {
  local instance_id="$1"

  aws --output text ec2 \
      describe-instances --instance-ids $instance_id \
      --query "Reservations[0].Instances[0].PrivateIpAddress"
}

##############################################################################
#
# Given and instance-id output the keyname used.  This might be None if no
# no keypair is set.
#
# Args:
#   instance_id - ec2 instance-id
#
# Output:
#   keyname or None
#
##############################################################################
aws_ec2_key_name() {
  local instance_id="$1"

  aws --output text ec2 \
      describe-instances --instance-id ${instance_id} --query "Reservations[0].Instances[0].KeyName"
}

##############################################################################
#
# Given and instance-id output the name tag blank if none or no value
#
# Args:
#   instance_id - ec2 instance-id
#
# Output:
#   name tag or blank
#
##############################################################################
aws_instance_name() {
    local instance_id="$1"

    aws --output text ec2 \
	describe-tags --filters "Name=resource-id,Values=${instance_id}" --query 'Tags[?Key==`Name`].Value'
}

##############################################################################
#
# Given an instance_id and keyname output the decrypted windows lanadmin pw
#
# Args:
#   instance_id - ec2 instance-id
#   keyname     - name of keypair
#
# Output:
#   lanadmin pw
#
##############################################################################
aws_ec2_get_password() {
  local instance_id="$1"
  local key_path="$2"

  aws --output ec2 \
      get-password-data --instance-id ${instance_id} --priv-launch-key ${key_path} \
      --query "PasswordData"
}

##############################################################################
#
# Returns the default aws user for an ami given its name
#
# Args:
#   ami_ame     - AMI name
#
# Output:
#   username
#
##############################################################################
aws_user_from_ami_name() {
    local ami_name="$1"

    local user
    case ${ami_name} in
	*WIN*)     user=lanadmin ;;
	*RHEL*)    user=ec2-user ;;
	*AmazonLinux*) user=ec2-user ;;
	*Ubuntu*)  user=ubuntu   ;;
	*core*)    user=core     ;;
    esac

    echo $user
}

##############################################################################
#
# Copy ami_id in region to target_name/target_description usig kms_key_id
#
# Args:
#  source_region      - AWS Sourcr Region
#  source_ami_id      - source ami_id in region
#  kms_key_id         - kms cof/ebs/encrypted arn
#  target_region      - AWS Target Region
#  target_name        - target ami name
#  target_description - target ami description
#
# Output:
#   tagret ami id
#
##############################################################################
aws_ec2_copy_ami() {
    local source_region="$1"
    local source_ami_id="$2"
    local kms_key_id="$3"
    local target_region="$4"
    local target_name="$5"
    local target_description="$6"

    cond_run aws --output text ec2 copy-image \
	--source-region ${source_region} \
	--source-image-id ${source_ami_id} \
	--region ${target_region} \
	--name ${target_name} \
	--description "\"${target_description}\"" \
	--encrypted \
	--kms-key-id ${kms_key_id}
}

##############################################################################
#
# Given a shell_glob return the ami id of
# the newest ami matching glob.
#
# Args:
#   glob       - shell glob of ami name to match
#
# Output:
#  ami_id or blank if not matched
#
##############################################################################
aws_ami_find_id() {
  local glob="$1"

  aws --output text ec2 describe-images \
      --owners self --filters "Name=name,Values=${glob}" \
      --query "Images[*].[Name,ImageId]" | \
      sort -k 1,1 | tail -1 | awk '{ print $2 }'
}

##############################################################################
#
# Given a instance_id return the ami name
#
# Args:
#   instance_id - aws instance_id
#
# Output:
#  ami_name or blank if not matched
#
##############################################################################
aws_ami_name_from_instance_id() {
  local instance_id="$1"

  local ami_id=$(aws --output text ec2 describe-instances \
		     --instance-ids $instance_id --query "Reservations[0].Instances[0].ImageId")

  aws --output text ec2 describe-images \
		     --image-ids $ami_id --query "Images[0].Name"

}

##############################################################################
#
# Look up the PrefixListId.  Right now this is only s3
#
# Args:
#
# Output:
#  pl-XXXXXX
#
##############################################################################
aws_prefix_id() {

    aws --output text ec2 describe-prefix-lists --query "PrefixLists[].PrefixListId"
}

##############################################################################
#
# Display console from EC2 instance_id
#
# Args:
#   instance_id - ec2 instance_id
#
# Output:
#  system log
#
# N.B: system log may be blank
#
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html
#
# This output is buffered because the instance produces it and then posts it to a
# store where the instance's owner can retrieve it.
#
# For Windows instances, the instance console output displays the last three system
# event log errors.
#
# The posted output is not continuously updated; only when it is likely to be of the
# most value. This includes shortly after instance boot, after reboot, and when the instance terminates.
#
# Only the most recent 64 KB of posted output is stored, which is available for at least 1
# hour after the last posting. Only the instance owner can access the console output.
# You can retrieve the console output for your instances using the console or the command line.
#
##############################################################################
aws_console_output() {
  local instance_id="$1"

  aws --output text ec2 get-console-output --instance-id ${instance_id}
}

##############################################################################
#
# Make a snapshot of rds with id snapshot.  Tag it
# with tags of which there must be at least one. Hopefully Name!
#
# Args:
#   rds        - id of rds instance
#   snapshot   - name of snapshot to make
#   tags       - Key=name1,Value=val1[ Key=name2,Value=val2...]
#
# Output:
#  json for snashpt made
#
##############################################################################
aws_rds_snapshot() {
  local rds="$1"
  local snapshot="$2"
  local tags="$3"

  cond_run aws rds create-db-snapshot --db-snapshot-identifier ${snapshot} --db-instance-identifier ${rds} --tags ${tags}
}

##############################################################################
#
# Given a return list of RoleIds for all the federated roles.
#
# Args:
#   role_name  - name of a role to look up
#
# Output:
#   RoleId
#
##############################################################################
aws_rds_snapshot_list() {
    local glob="$1"

    aws --output text rds describe-db-snapshots --query "DBSnapshots[].[VpcId, DBInstanceIdentifier, DBSnapshotIdentifier, SnapshotCreateTime]" | grep "$glob"
}

##############################################################################
#
# Return list of RoleIds for all the federated roles.
#
# Args:
#
# Output:
#   list of strings space sep of RoleIds
#
##############################################################################
aws_human_role_ids() {

    aws --output text iam list-roles --query "Roles[].[RoleId,RoleName]" | awk '/GR_GG_COF_AWS/ { print $1 }'
}

##############################################################################
#
# Return list of RoleIds for all the federated roles.
#
# Args:
#   role_name  - name of a role to look up
#
# Output:
#   RoleId
#
##############################################################################
aws_role_id_for_role() {
    local role_name="$1"

    aws --output text iam list-roles --query "Roles[].[RoleId,RoleName]" | grep "$role_name$" | awk '{ print $1 }'
}

##############################################################################
#
# Generates aws cli shorthand Key=Value params for aws cloudformation create-stack
# or update-stack. Used by aws_stack_make().
#
# Makes it easy to optionally pass a consistent set of Capital One required
# tags to a CFT with standardized naming and values. Optionally adds a Name Tag
# for use in naming resources with name prefixs.
#
# Also adds all remaining key=value pairs.  Supports mutlti-value and multiple
# Keys.  Last wins.
#
##############################################################################
aws_build_params() {
  local name="$1"     ; shift
  local app="$1"      ; shift
  local owner_contact="$1" ; shift
  local env_code="$1" ; shift
  local std_tags="$1" ; shift
  local tag_name="$1" ; shift
  local custom_tags="$1" ; shift

  local nl=" "
  if [ -n "${TEST_MODE}" ]; then
     nl="
"
  fi

  local params=$(aws_build_common_params "${nl}" "general" "${app}" "${owner_contact}" "${env_code}" "${std_tags}" "${tag_name}" "${custom_tags}")
  params="$params$nl"

  for pair in "$@"; do
    local key=$(echo $pair | cut -f 1 -d =)
    local val=$(echo $pair | cut -f 2 -d =)

    params="$params ParameterKey=$key,ParameterValue=\'$val\'$nl"
  done

  if [ -n "${TEST_MODE}" ]; then
    if [ -n "$params" ]; then
      echo "$params" | sed -e '/^$/d'
    else
      echo $params
    fi
  else
      echo $params
  fi
}

##############################################################################
#
# Generates aws cli shorthand Key=Value params for aws cloudformation create-stack
# or update-stack. Used by aws_build_params.
#
# Every AWS Resource you make should have these tags.
#
##############################################################################
aws_build_common_params() {
  local nl="$1"
  local paramtype="$2"
  local app="$3"
  local owner_contact="$4"
  local env_code="$5"
  local std_tags="$6"
  local tag_name="$7"
  local custom_tags="$8"

  local keyname=
  local keyvalue=

  # XXX: Like Really AWS?
  if [ x"${paramtype}" = x"general" ]; then
      keyname=ParameterKey
      keyvalue=ParameterValue
  else
      keyname=Key
      keyvalue=Value
  fi

  app=$(echo ${app} | tr 'a-z' 'A-Z')

  if [ x"${std_tags}" = x"std_tags" ]; then
    params="$params $keyname=ASV,$keyvalue=ASV${app}$nl"
    params="$params $keyname=CMDBEnvironment,$keyvalue=ENV${env_code}${app}$nl"
    params="$params $keyname=OwnerContact,$keyvalue=${owner_contact}$nl"
  fi

  if [ -n "${custom_tags}" ]; then
      local pair
      local SAVE_IFS=$IFS
      IFS=';'
      for pair in ${custom_tags}; do
	  local k=$(echo $pair | cut -d'=' -f 1)
	  local v=$(echo $pair | cut -d'=' -f 2)
	  if [ -z "${DRY_RUN}" ]; then
	      k=$(echo $k | sed -e 's,_,\\ ,g')
	  fi
	  params="$params $keyname=$k,$keyvalue=$v$nl"
      done
      IFS=$SAVE_IFS
  fi

  if [ -n "${tag_name}" -a x"${tag_name}" != x"--" ]; then
    params="$params $keyname=Name,$keyvalue=${tag_name}$nl"
  fi

  echo "$params"
}

# ------------------------------------------------------------------------------
##############################################################################
#
# DEPRECATED.  If you're in he NextGen or 2.0 or Flat Subnet model you shouldn't
# need this.
#
##############################################################################
aws_subnet_zone() {
    local subnet_id="$1"

    aws --output text ec2 describe-subnets --subnet-ids "${subnet_id}" --query "Subnets[0].AvailabilityZone"
}
##############################################################################
#
# This API should be considered stable.  It _must_ follow versioning rules
# outlined here - http://apr.apache.org/versioning.html.
#
# Any "global" variables or functions must start with "__test_*" so as not
# to pollute the users namespace.
#
# Additional helpers functions much appreciated!
#
##############################################################################

# ============================================================================
# ================================= Test Steps ===============================
# ============================================================================

##############################################################################
#
# Must be called EXACTLY ONE(1) time  before calling any other function
#
# Initializes Internal state
#
##############################################################################
test_init() {

    __test_asserted=0
    __test_failed=0
    __test_passed=0
    __test_name=

    __test_dir_orig=${pwd}
    __test_tmpdir=""
}

##############################################################################
#
# Must be called EXACTLY ONE(1) time as the start of EACH test.
#
# Args:
#  name - test name
#
# Output
#  name\n in cyan
#
# SIDE EFFECTS: CWD/PWD is changed to a dedicated,random,empty dir which
#               is created on demand.
#
##############################################################################
test_start() {
    local name="$1"

    __cyan "# ${name}\n"

    __test_name=${name}
    __test_tmpdir=$(mktemp -d -t "test")
    cd "$__test_tmpdir"
}

##############################################################################
#
# Must be called EXACTLY ONE(1) time as the end of EACH test.
#
# Output
#  Colored summary of assertions, passes, failures
#
# SIDE EFFECTS:
#  remove test tmp dir made in test_start()
#  returns to original dir before test_start()
#
##############################################################################
test_end() {

    [ -z "${DEBUG}" ] && rm -rf $__test_tmpdir
    cd $__test_dir_orig

    local pcnt=$(echo "scale=2 ; ($__test_passed/$__test_asserted)*100" | bc -lq)

    __msg
    __msg    "## Summary($__test_name):\n"
    __red    "- Failed    : $__test_failed\n"
    __green  "- Passed    : $__test_passed\n"
    __purple "- Assertions: $__test_asserted\n"
    __cyan   "- Percent   : $pcnt %%\n"
}

##############################################################################
#
# Must be called EXACTLY ONE(1) time when done.
#
# Currently I do nothing.  This is not the end state, you must use this.
#
##############################################################################
test_finish() {
    true
}

# ============================================================================
# ========================= Callable outside of tests ========================
# ============================================================================

##############################################################################
#
# Executes all tests in dir with prog
#
##############################################################################
tests_run() {
    local prog="$1"
    local dir="$2"

    local tests=$(cd $dir ; ls -1)
    local test
    for test in ${tests}; do
	test_run "${prog}"  "${dir}/${test}"
	__msg
    done
}

##############################################################################
#
# Executes test with prog and sets env var TEST_MODE=1 during the run
#
##############################################################################
test_run() {
    local prog="$1"
    local test="$2"

    TEST_MODE=1 ${prog} ${test}
}

# ============================================================================
# ================================= Testers ==================================
# ============================================================================

##############################################################################
#
# Outputs msg and runs cmd.  Checks if the STDOUT output of cmd is
# exactly len long.
#
# Args:
#   msg - informational msg
#   cmd - "[env] cmd [options] [args]
#   len - integer >= 0
#
# Output
#  colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_assert_len() {
    local msg="$1"
    local cmd="$2"
    local len="$3"

    __test_asserted=$(($__test_asserted + 1))
    __msg "${__test_asserted}. \t$msg: \c"

    local rc=$($cmd 2>./stderr 1>./stdout)
    local str=$(cat ./stdout)

    if [ ${#str} = $len ]; then
	__test_pass
    else
	__test_fail
	__msg "- [len($str)]=${#str} != $len"
    fi
}

##############################################################################
#
# Given msg, regex|file, and remaining args - oputput msg then let cmd=args
# and run cmd.  If file, diff file against stdout of cmd else use awk
# to run stdout through regex.  If diff is identical or all lines of output
# match regex then PASS else FAIL.
#
# Args:
#   msg          - informational msg
#   pcre_or_file - pcre or file.  if -e then assume file, else regex
#
#   cmd - "[env] cmd [options] [args]
#          built from any subsequent args
# Output
#  colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_assert_grep() {
    local msg="$1"
    local pcre_or_file="$2"
    shift 2
    local cmd="$@"

    __test_asserted=$(($__test_asserted + 1))
    __msg "${__test_asserted}. $msg: \c"

    local rc=$($cmd 2>./stderr 1>./stdout)
    
    local rv=0
    if [ -e "$pcre_or_file" ]; then
	diff -u ./stdout $pcre_or_file >> ./stderr
	rv=$?
    else
	if [ -z "$pcre_or_file" ]; then
	    local size=$(/usr/bin/stat ./stdout |awk '{ print $8 }')
	    rv=$size
	else
	    cat ./stdout | awk "/$pcre_or_file/ && err=1 END { exit !err }" > /dev/null 2>> ./stderr
	    rv=$?
	fi
    fi

    if [ $rv -eq 0 ]; then
	__test_pass
    else
	__test_fail
	__msg "- $pcre_or_file not matched"
	__msg "- DIR: $__test_tmpdir"
	__msg "- file"
	echo "\`\`\`text"
	[ -e "$pcre_or_file" ] && cp $pcre_or_file . && cat $pcre_or_file
	echo "\`\`\`text"
	__msg "- stdout"
	echo "\`\`\`text"
	cat ./stdout
	echo "\'\'\'"
	__msg "- stderr"
	cat ./stderr
	echo
	echo
    fi
}

##############################################################################
#
# Given msg, fixtue, output, and remaining args let cmd=args.
# run cmd.  cmd is expected to have made output.  diff fixture output.
# If differences FAIL else PASS
#
# Args:
#   msg          - informational msg
#   fixture      - /path/to/fixture
#   output       - relative path to file that cmd will make
#
#   cmd - "[env] cmd [options] [args]
#          built from any subsequent args
# Output
#  colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_assert_file_match() {
    local msg="$1"
    local fixture="$2"
    local output="$3"
    shift 3
    local cmd="$@"

    __test_asserted=$(($__test_asserted + 1))
    __msg "${__test_asserted}. $msg: \c"

    local rc=$($cmd 2>./stderr 1>./stdout)

    diff -u $fixture $output

    if [ $? -eq 0 ]; then
	__test_pass
    else
	__test_fail
	__msg "- $fixture differs from $output"
	__msg "- DIR: $__test_tmpdir"
	__msg "- fixture"
	echo "\`\`\`text"
	cat $fixture
	echo "\`\`\`"
	__msg "- stdout"
	echo "\`\`\`text"
	cat ./stdout
	echo "\`\`\`"
	__msg "- stderr"
	echo "\`\`\`text"
	cat ./stderr
	echo "\`\`\`"
	echo
	echo
    fi
}

##############################################################################
#
# Outputs msg, then checks if a = b.  Any number or string will be compared as
# strings. "" = "", etc....  If equal PASS else FAIL
#
# Args:
#   msg          - informational msg
#   a            - item 1
#   b            - item 2
#
# Output
#  colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_assert_eq() {
    local msg="$1"
    local a="$2"
    local b="$3"
    local suppress="${4:-0}"

    __test_asserted=$(($__test_asserted + 1))
    __msg "${__test_asserted}. $msg: \c"

    if [ x"$a" = x"$b" ]; then
	__test_pass
    else
	__test_fail
	if [ $suppress -ne 1 ]; then
	    __msg "- a: [$a]"
	    __msg "- b: [$b]"
	fi
    fi
}

##############################################################################
#
# Outputs msg, then runs cmd.  Verifies that there is no stderr output or that
# stderr size is 0.  If stderr is found FAIL else PASS
#
# Args:
#   msg          - informational msg
#   cmd          - "[env] cmd [options] [args]" to run
#
# Output
#  colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_assert_no_error() {
    local msg="$1"
    local cmd="$2"

    __test_asserted=$(($__test_asserted + 1))
    __msg "${__test_asserted}. $msg: \c"

    local rc=$($cmd 2>./stderr 1>./stdout)

    local size=$(stat -f "%z" ./stderr)
    if [ -e ./stderr -a $size -gt 0 ]; then
	__test_fail
	__msg "- stdout"
	echo "\`\`\`text"
	cat ./stdout
	echo "\`\`\`"
	__msg "- stderr"
	echo "\`\`\`text"
	cat ./stderr
	echo "\`\`\`"
    else
	__test_pass
    fi
}

##############################################################################
#
# Looks for a security group with name sg_name.
# If found PASS else FAIL.
#
# Args:
#   sg_name   - name of security group (not the id)
#
# Output
#  info message + colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_aws_sg_exists() {
    local sg_name="$1"

    local rc=$(aws_test_sg_exists "${sg_name}")

    test_assert_eq "Checking ${sg_name}" "$rc" "1"
}

##############################################################################
#
# Validates file is a syntatically valid CFT.
# If valid then PASS else FAIL.
#
# Args:
#   file      - full path to a CFT to verify using AWS's API
#
# Output
#  info message + colored PASSED | FAILED
#  if FAILED diagnostics
#
##############################################################################
test_aws_cft_validate() {
    local file="$1"

    test_assert_grep "Checking ${file}" "0" "aws_test_stack_template" "file:///$template"
}

# ============================================================================
# =========================== Integration Helpers ============================
# ============================================================================

##############################################################################
#
# Use AWS API to verify a security group with name stack_prefix-sg_name exists
#
# Args:
#   sg_name      - Security Group name
#
##############################################################################
aws_test_sg_exists() {
    local sg_name="$1"

    aws --output text ec2 describe-security-groups --query "SecurityGroups[].{Name:GroupName}" | \
	grep -c ${sg_name}
}

##############################################################################
#
# Use AWS API to validate syntax and references of a CFT.  Doesn't run it
#
# Args:
#   template  - full path to template to validate (eventually an s3://)
#
##############################################################################
aws_test_stack_template() {
    local template="$1"

    aws cloudformation validate-template --template-body $template > /dev/null
    echo $?
}

# ============================================================================
# =========================== NON PUBLIC ======== ============================
# ============================================================================

#############################################################################
#
# util
#
#############################################################################
__test_fail() {

    __test_failed=$(($__test_failed + 1))
    __red "FAILED\n"
}

__test_pass() {

    __test_passed=$(($__test_passed + 1))
    __green "PASSED\n"
}

__msg() {
    local msg="$1"

    echo "${msg}"
}

##############################################################################
#
# colors
#
###############################################################################
__cyan()   {
    case ${TEST_NO_COLOR} in
	1) echo "$1" ;;
	*) printf "\e[0;36m${1}\e[0m" ;;
    esac
}
__green()  {
    case ${TEST_NO_COLOR} in
	1) echo "$1" ;;
	*) printf "\e[0;32m${1}\e[0m" ;;
    esac
}
__purple() {
    case ${TEST_NO_COLOR} in
	1) echo "$1" ;;
	*) printf "\e[0;35m${1}\e[0m" ;;
    esac
}
__red()    {
    case ${TEST_NO_COLOR} in
	1) echo "$1" ;;
	*) printf "\e[0;31m${1}\e[0m" ;;
    esac
}
__clear()  {
    case ${TEST_NO_COLOR} in
	1) echo "$1" ;;
	*) printf "\e[0;31m${1}\e[0m" ;;
    esac
}
##############################################################################
#
# Given a template file (infile) fill it in and save it as outfile
#
# Note by convention infile should end in .in i.e file.in
# Note by convention outfile should resemble infile in name but allows
#  for one template to output several permutations.
#
# Note %%token%% are the tokens
#
# Args:
#  infile  - full path to template file
#  outfile - full path to output file
#  q_flag  - no_quotes or quoted
#  sed_res - 1+ sed -e lines which will be passwed to sed(1) on the shell cli
#            in q_flag quoting
#
# SIDE EFFECTS: outfile is created
#
##############################################################################
template_fill_in() {
    local infile="$1"
    local outfile="$2"
    local q_flag="$3"
    shift 3

    rm -f $outfile
    cp $infile $outfile
    local sed_re
    local SAVE_IFS=$IFS
    IFS=#
    for sed_re in $@; do
	if [ x"$q_flag" = x"no_quotes" ]; then
	    debug "N: sed -i ''  -e $sed_re $outfile"
	    sed -i ''  -e $sed_re $outfile
	else
	    debug "Q: sed -i ''  -e \"$sed_re\" $outfile"
	    sed -i ''  -e "$sed_re" $outfile
	fi
    done
    IFS=$SAVE_IFS
}

default_list() {
    local stack_prefix="$1"
    local env="$2"
    local app="$3"
    local region="$4"
    local s3_bucket_name="$5"
    local s3_env_bucket_name="$6"
    local s3_int_bucket_name="$7"
    local ad_name="$8"

    echo "STACK_PREFIX=$stack_prefix,ENV=$env,APP=$app,REGION=$region,S3_BUCKET=$s3_bucket_name,S3_ENV_BUCKET=$s3_env_bucket_name,S3_INT_BUCKET=$s3_int_bucket_name,AD_NAME=$ad_name"
}

##############################################################################
#
# Given args, return a string of sed_res with tokens i.e: s,%%k%%,v,g
#
# Args:
#
# Output:
#
##############################################################################
default_tokens() {
    local stack_prefix="$1"
    local env="$2"
    local app="$3"
    local region="$4"
    local s3_bucket_name="$5"
    local s3_env_bucket_name="$6"
    local s3_int_bucket_name="$7"
    local ad_name="$8"

    local default_list=$(default_list "$stack_prefix" "$env" "$app" "$region" "$s3_bucket_name" "$s3_env_bucket_name" "$s3_int_bucket_name" "$ad_name")
    token_args_from_list "%%" "/" "," ${default_list}
}

##############################################################################
#
# Given a str of k=v pairs seperated by split generate sed -e sSMaMSbSg lines
# where S is sep and M is mark. Join results by + which I've haven't had to
# use in a substition pattern yet.
#
# i.e. s,%%a%%,b,g
#
# Args:
#  mark  - surrounding token identifier "" is valid too
#  sep   - delimiter for sed substitutions
#  split - k=v pairs are seperated by this
#  args  - k=v list
#
# Output:
#  sed_res
#
##############################################################################
token_args_from_list() {
  local mark="$1"
  local sep="$2"
  local split="$3"
  shift 3
  local list="$@"

  local pair
  local args
  local SAVE_IFS=$IFS
  IFS=$split
  for pair in $list; do
      local k=$(echo $pair |cut -f 1 -d '=')
      local v=$(echo $pair |cut -f 2- -d '=')
      args="${args}s${sep}${mark}${k}${mark}${sep}${v}${sep}g#"
  done
  IFS=$SAVE_IFS
  echo $args |sed -e 's,\#$,,'
}

##############################################################################
#
# Meant to be used in a loop to wait 2x as long before trying something again
# You don't want to hit an API as fast as possible if your doing something like
# waiting for Windows to boot which takes ~11min with our AMIs.
#
# Args:
#  i - how long to wait
#
# Output
#  2*i (aka double)
#
##############################################################################
doubling_backoff_retry() {
  local i="${1:-1}"

  sleep ${i}

  echo $(($i*2))
}

##############################################################################
#
# Generates a pseudo-random INSECURE password of length len
#
# Args:
#  len - length of password to generate
#
# Output:
#  the password
#
##############################################################################
make_password() {
  local len="$1"

  local pw=$(cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c ${len})
  echo $pw
}

##############################################################################
#
# Returns unqualified direct childern of a directory that you have  r,x permissions to
# If it exists.  If not ""
#
# Args:
#  dirs - 1+ full paths to dirs
#
# Output:
#  the children list
#
##############################################################################
list_dirs() {

    local dir
    for dir in "$@"; do
	if [ -d $dir ]; then
	    (cd $dir ; ls -1)
	fi
    done
}

##############################################################################
#
# Determines if something (script) should be run based on a list of things
# to skip (skip_list).  If script is in skip_list return 0 else 1
#
# You can interpret the 0/1 either way you like though I recommend being consistent
# and 1 means yes, 0 no.
#
# This works in all shells (ba)sh,(t)csh,zsh and its implimentation is intentional.
#
# Args:
#   script    - file name (will strip .sh extension if present)
#   skip_list - list of file names without .sh extension to skip
#
# Output:
#  0|1
#
# Note, It does not run the thing only checks if you should
##############################################################################
should_run() {
    local script="${1%.sh}"
    local skip_list="$2"

    local item
    for item in $(echo $skip_list); do
	if [ "$item" = "$script" ]; then
	    echo 0
	    return
	fi
    done

    echo 1
}

##############################################################################
#
# KeyName is option.  If this context should make a keypair then return its
# name.
#
# Args:
#   cmd       - file name (will strip .sh extension if present)
#   skip_list - list of file names without .sh extension to skip
#   key_name  - name of key
#
# Output:
#   "" or key_name
#
##############################################################################
key_name_get() {
  local cmd="$1"
  local skip_list="$2"
  local key_name="$3"

  local needs_ec2_keypair=$(should_run "${cmd}" "${skip_list}")
  local ec2_key_name
  case ${needs_ec2_keypair} in
      0) ec2_key_name= ;;
      1) ec2_key_name=${key_name} ;;
  esac

  echo $ec2_key_name
}

##############################################################################
#
# If key_name is None or DNE Output msg and die with code 32
#
# If nofatal is nofatal then echo/return instead of die
#
# Args:
#  key_name - name of key
#  msg      - msg to output
#
# Output
#  msg || none
#
# EXITS
#
##############################################################################
key_check() {
    local key_name="$1"
    local msg="$2"
    local nofatal="$3"

    local flag=pass
    if [ x"$key_name" = x"None" ]; then
	flag=fail
    elif [ ! -r ${key_name} ]; then
	flag=fail
    fi

    case ${flag} in
	fail)
	    if [ x"$nofatal" = x"nofatal" ]; then
		msg "${msg}"
		return 32
	    else
		die "32" "${msg}"
	    fi
	    ;;
    esac
}

##############################################################################
#
# Runs a script if found in list with shell.  Set shell flags set_flags
# and invokes shell with cmd_env as ENV.  PATH should be part of cmd_env.
#
# First match wins in list
#
# Args:
#  cmd_env   - string of k=v pairs space separated
#  shell     - which shell (i.e. sh|ksh|(ba)sh|(t)csh|zsh
#              code which gets run must work in this shell
#  set_flags - space seperated list of shell set flags (i.e. -e -x)
#  cmd       - file_name to run
#  exts      - space seperated string of file extensions. [default: .sh]
#  arg_list  - args to pass to cmd (including options) or ""
#  list      - 1+ dirs to look for cmd in
#
# Return
#  exit code of cmd || nothing if not found
#
##############################################################################
run_script() {
    local cmd_env="$1"
    local shell="$2"
    local set_flags="$3"
    local cmd="$4"
    local exts="${5:-.sh}"
    local arg_list="$6"
    shift 6

    local file=$(file_cascade "${cmd}" "${exts}" $@)
    debug "Run: [$file]"
    env -i ${cmd_env} ${shell} ${set_flags} ${file} $arg_list
}

##############################################################################
#
# Finds file with any extension in exts in remaining dir args
# First match wins in list
#
# Args:
#  file      - file_name to find
#  exts      - space seperated string of file extensions or blank
#  list      - 1+ dirs to look for cmd in
#
# Return
#  full path of file if found || nothing if not
#
##############################################################################
file_cascade() {
    local cmd="$1"
    local exts="$2"
    shift 2

    # Search
    local path
    for path in "$@"; do
	if [ -z "${exts}" ]; then
	    debug "Looking: [$path/$cmd]"
	    if [ -f "$path/$cmd" ]; then
		debug "Found: $path/$cmd"
		echo "$path/$cmd"
		break 2
	    fi
	else
	    local ext
	    for ext in $exts ''; do
		debug "Looking: [$path/$cmd$ext]"
		if [ -f "$path/$cmd$ext" ]; then
		    debug "Found: $path/$cmd$ext"
		    echo "$path/$cmd$ext"
		    break 2
		fi
	    done
	fi
    done
}

##############################################################################
#
# Source file if exists and readable (chmod +r)
#
# Args:
#  file - full path to file
#
# SIDE EFFECTS: whatever file does
#
##############################################################################
load_file() {
    local file="$1"

    debug "Loading $file"
    [ -r $file ] && . $file
}

##############################################################################
#
# Adds appends dir to path if dir exists and returns path
# Final result should be used in export PATH=$PATH or similiar.
#
# Args:
#   dir      - /path
#   path     - current PATH
#
# Output
#   new path
#
# Doesn't modify the live PATH in anyway
#
##############################################################################
path_if() {
    local dir="$1"
    local path="$2"

    local SAVE_IFS=$IFS
    IFS=' '
    if [ -d $dir ]; then
	if [ -n "${path}" ]; then
	    path="${path}:$dir"
	else
	    path="$dir"
	fi
    fi
    echo $path
    IFS=$SAVE_IFS
}

##############################################################################
#
# Stops Dead if env is prod
#
# Args:
#  env - dev|qa|prod
#
##############################################################################
prod_gaurd() {
    local env="$1"

    if [ x"${env}" = x"prod" ]; then
	if [ -n "${TEST_MODE}" ]; then
	    echo "ARE YOU NUTS?"
	    return 255
	else
	    die "255" "ARE YOU NUTS?"
	fi
    fi
}

##############################################################################
#
# Creates an enc key in key_file of key_size using openssl base64
#
# Args:
#  key_size - 2048|4096|8192
#  key_file - full /path to save key in
#
# SIDE EFFECTS: key_file is created
#
##############################################################################
key_generate() {
  local key_size="$1"
  local key_file="$2"

  if [ ! -r ${key_file} ]; then
      openssl rand -base64 ${key_size} > ${key_file}
  fi
}

##############################################################################
#
# Prompt user for Y or n.  Continue until interrupted or Y or n.
# If n exit else continue
#
# Output:
#  Prompt msgs
#
##############################################################################
confirm() {

    while [ : ]; do
	msg "Are you sure Y/n?: \c"
	local answer
	read answer

	[ x"${answer}" = x"Y" -o x"${answer}" = x"n" ] && break
    done

    if [ x"${answer}" = x"n" ]; then
	if [ -n "${TEST_MODE}" ]; then
	    echo "Asked to Exit"
	    return 42
	else
	    die "42" "Asked to Exit."
	fi
    fi
}

##############################################################################
#
# If DRY_RUN (global) is set in ENV then log and format cmd
# else run it!
# let cmd=args
#
# BIG_DOG_PASS env value will be filtered if present
#
# Args:
#  args - 1+ args
#
# Output:
#  whatever cmd outputs
#
# XXX: uses perl
#
##############################################################################
cond_run() {
    local cmd="$*"

    if [ -n "${DRY_RUN}" ]; then
	[ -z "${BIG_DOG_PASS}" ] && BIG_DOG_PASS=XXXXXXXXXXXXXXXXXXXXXXXX
	log "$cmd" | perl -p -e "s, , \\\\\n\t,g" | sed -e "s,${BIG_DOG_PASS},BIG_DOG_PASS,g"
    else
	eval $cmd
    fi
}

##############################################################################
#
# Will conditionally append add_str to str seperated by sep (defaults to ,)
# if the flag is not 0.
#
# Args:
#  str       - original string
#  flag      - 0|anything
#  add_str   - what to append
#  sep       - seperatation token i.e. ,
#
# Output:
#   string with appended info
#
##############################################################################
cond_add_str() {
    local str="$1"
    local flag="$2"
    local add_str="$3"
    local sep="${4:-,}"

    if [ x"$flag" != x"0" ]; then
	str="$str${sep}$add_str"
    fi

    echo $str
}

##############################################################################
#
# Will conditionally append add_str to str seperated by sep (defaults to ,)
# if the env is not contained not_env.
#
# Args:
#  str       - original string
#  thing     - thing i.e. env being run in dev|qa|prod|dr
#  not_thing - any subset of the above
#  add_str   - what to append
#  sep       - seperatation token i.e. ,
#
# Output:
#   string with appended info
#
##############################################################################
cond_subset_add_str() {
    local str="$1"
    local thing="$2"
    local not_thing="$3"
    local add_str="$4"
    local sep="${5:-,}"

    case $thing in
	$not_thing) ;;
	*)
	    str="$str${sep}$add_str"
	    ;;
    esac

    echo $str
}

##############################################################################
#
# Wait until ssh is responding.  This may hang if ssh never comes up
#
# Args:
#  ip - ip address
#
# Output:
#  none
#
##############################################################################
wait_for_ssh() {
  local ip="$1"

  local avail=n
  while [ "$avail" != "y" ]; do
    ssh -N -o ConnectTimeOut=2 -o BatchMode=yes $ip 'echo' >/dev/null 2>&1
    echo .
    case $? in
      0) avail=y ;;
      *) avail=n ;;
    esac
    sleep 5
  done
}

##############################################################################
#
#
##############################################################################
value_for_key_from_list() {
    local key="$1"
    local list="$2"

    if ! echo $list | grep -q :; then
	echo $list
    else
	echo $list | grep -Eo "$key:.[a-zA-Z0-9_\-\.]+" | sed -e 's, .*,,g' -e 's,.*:,,'
    fi
}

##############################################################################
#
# Obligatory STDOUT/STDERR et al wrappers.
#
#############################################################################
msg() {
    echo "$@"
}

verbose() {
    local level="$1"
    shift

    VERBOSE=${VERBOSE:-0}
    [ $VERBOSE -ne 0 -a \( $level -gt $VERBOSE -o $level -eq $VERBOSE \) ] && echo "$@"
}

log() {
    echo "$@"
}
elog() {
    echo >&2 "$@"
}

error() {
    echo >2 "$@"
}

die() {
    local code="$1"
    shift

    echo "$@"
    exit $code
}

debug() {
    [ -n "$DEBUG" ] || return

    echo >&2 "$@"
}

header() {
    local indent="$1"
    shift

    local i=0
    while [ $i -lt $indent ]; do
	echo "=\c"
	i=$(($i+1))
    done

    echo "> \c"
    echo "$@"
}
##############################################################################
#
# Processes src to dst filling in %%placeholders%%
# complex is for multiline inserts or hard to escape/quote,
# otherwise use pairs.  Both may be used simultaneously.  If both
# provide values for the same %%token%% then pairs wins.
#
# Args:
#   src     - full path to src file
#   dst     - full path to dst file
#   pairs   - comma sep list of n=v pairs
#   complex - token:file
#
# Output:
#   none
#
# SIDE EFFECTS:
#   dst file exists, caller MUST cleanup
#
##############################################################################
aws_cft_preprocess() {
      local src="$1"
      local dst="$2"
      local pairs="$3"
      local complex="$4"

      local fixes="\"{={%\" {={%}\"=}"
      local token_args
      if [ -n "$pairs" ]; then
	  token_args=$(token_args_from_list "" "@" "%" "${pairs}%${fixes}")
      fi

      if [ -n "$complex" ]; then
	  local token=$(echo ${complex} | cut -d = -f 1)
	  local file=$(echo ${complex} | cut -d = -f 2)

	  token_args="${token_args}#/${token}/r ${file}"
	  token_args="${token_args}#/${token}/d"
      fi

      template_fill_in "${src}" "${dst}" "quoted" "${token_args}"
      verbose "1" "$(cat ${dst})"
}

##############################################################################
#
# Runs scripts in dirs with shell matching regex which are
# not in skip_list. Search dirs in order.
#
# Args:
#   cmd_env   - [VAR1=VAL1 VAR2=VAL2...]
#   shell     - which shell to run under
#   regex     - grep pattern to limit to
#   skip_list - srring to skip space separated
#   exts      - list of extensions to search for
#   dirs      - 1+ ordered dirs to look in
#
# Outputs
#   Status Mgs + scripts output
#
##############################################################################
stacks_run() {
  local cmd_env="$1"
  local shell="$2"
  local regex="$3"
  local skip_list="$4"
  local exts="$5"
  shift 5

  local scripts=$(list_dirs "$@" | sort)

  local stack
  for stack in ${scripts}; do
    stack=$(echo $stack | sed -e 's,\..*$,,')
    local rc=$(should_run "${stack}" "${skip_list}")
    if [ $rc -eq 1 ]; then
	local count=$(echo $stack | grep -c "${regex}")
	if [ $count -eq 1 ]; then
	    header "3" "Stack: ${stack}"
	    run_script "${cmd_env}" "${shell}" "" "${stack}" "${exts}" "" "$@"
	    msg
	fi
    fi
  done
}

##############################################################################
#
# Deletes stack who's name starts with stack_prefix
#
# Args:
#   stack_prefix  - Shell glob of stack prefix(es) to delete
#
# Output
#   Status Msgs + ASW CFT errors
#
##############################################################################
stacks_delete() {
  local stack_prefix="$1"

  local stacks=$(aws_stacks_list "${stack_prefix}")
  local stack
  for stack in $stacks; do
    header "15" "Deleting Stack: ${stack}"
    aws_stack_delete "${stack}"
  done
}

##############################################################################
#
# Given owner, iam_instance_profile, external_roles, and s3_eids.
# Look up the instance_role_id for each iam_instance_profile
# Look up the human (federated) role_ids
# hand off too aws_user_id_policy_str and return result which is usable
# as { "aws:userid": { "Ref": "S3BucketPolicyUserIds" } }
# in s3 bucket policy cfts.
#
# Args:
#   owner                 - Id of the account owner aka root
#   iam_instance_profiles - Names of the IAM roles that are assigned to your instances
#   other_roles           - Other Roles (not EC2 profiles)
#   s3_eids               - List of e_ids who should have access
#
# Output:
#   i.e: 873150696559 AROAIHANTKMPSXPTZTH2I:i-* AROAIIRCJMDBWVXR4KUWK:* AROAJCZT7HI7JILHGR6JS:epw763
#
##############################################################################
s3_bucket_policy_user_ids() {
    local owner="$1"
    local iam_instance_profiles="$2"
    local external_roles="$3"
    shift 3

    local instance_roles=""
    local SAVE_IFS=$IFS
    IFS=:
    local profile
    for profile in $iam_instance_profiles; do
	local instance_role_id=$(aws_role_id_for_role "${profile}")
	instance_roles="${instance_roles},${instance_role_id}:i-*"
    done
    IFS=$SAVE_IFS
    instance_roles=$(echo $instance_roles | sed -e 's/^,//')

    local other_roles=""
    SAVE_IFS=$IFS
    IFS=:
    local role_name
    for role_name in $external_roles; do
	local role_id=$(aws_role_id_for_role "${role_name}")
	other_roles="${other_roles},${role_id}:*"
    done
    IFS=$SAVE_IFS
    other_roles=$(echo $other_roles | sed -e 's/^,//')

    local role_str=
    local pair
    for pair in $@; do
	local role_name=$(echo $pair | cut -d : -f 1)
	local eid=$(echo $pair | cut -d : -f 2)

	local role_id=$(aws_role_id_for_role "${role_name}")
	if [ -z "${role_id}" ]; then
	    echo "1"
	    return
	fi
	role_str="${role_id}:${eid},${role_str}"
    done
    role_str=$(echo $role_str | sed -e 's/,$//')

    local rv="${owner},${instance_roles},${other_roles},${role_str}"
    rv=$(echo $rv | sed -e 's/,,/,/g')

    echo $rv
}

check_s3_role_ids() {
    local str="$1"

    [ -n "${str}" ] || die "51" "You must set s3_role_eids in the child config."
    [[ *:* ]]       || die "51" "s3_role_eids=role_name1:eid1[ role_name2:eid2 ...]"

}

s3_make() {
    local s3_role_ids="$1"
    local owner="$2"
    local iam_instance_profiles="$3"
    local external_roles="$4"
    local app="$5"
    local owner_contact="$6"
    local env_code="$7"
    local cf_dirs="$8"
    local template="$9"
    local std_tags="${10}"
    local stack_prefix="${11}"
    local bucket_name="${12}"
    local enc_type="${13}"
    local log_bucket="${14}"
    local stack_name="${15:-S3s}"

    header "5" "S3"
    header "10" "Checking S3 policy access"
    check_s3_role_ids "${s3_role_eids}"

    header "10" "Building ACL List"
    local user_ids=$(s3_bucket_policy_user_ids "${owner}" "${iam_instance_profiles}" "${external_roles}" ${s3_role_eids})
    GAURANTEE_S3_ACCESSIBLE $user_ids

    header "10" "Making Stack ${stack_prefix}-${stack_name}"
    aws_stack_make "${stack_prefix}-${stack_name}" \
		   "${APP}" "${owner_contact}" "${env_code}" "${cf_dirs}" "s3.json" \
		   "std_tags" "${stack_prefix}" "" \
		   "BucketName=${bucket_name}" \
		   "EncType=${s3_enc_type}" \
		   "S3BucketPolicyUserIds=${user_ids}" \
		   "S3AccessBucketName=${s3_s3_log_bucket_name}"
}

ec2_terminate_instance_with_name_tag() {
    local $tag="$1"

    local instance_id=$(aws_ec2_instance_id_from_name_tag "$tag")

    aws_ec2_instance_terminate "$instance_id"
}

##############################################################################
#
# Given an instance_id, ami_name, and key_path lookup up the 'admin' user
# password and return it.  Will log console log to STDOUT and do a doubling
# backoff retry until password is ready.
#
# Does nothing unless ami_name contains WIN
#
# Args:
#  instance_id - ec2 instance_id
#  ami_name    - ami_name
#  key_path    - path to key which will decrypt the pw
#
# Output:
#  ec2pass || nothing
#
###############################################################################
password_admin_get() {
    local instance_id="$1"
    local ami_name="$2"
    local key_path="$3"

    local pass

    local i=1
    while [ true ]; do
	local log=$(aws_console_output "${instance_id}")

	case ${ami_name} in
	    *WIN*)
		pass=$(aws_ec2_get_password "${instance_id}" "${key_path}")
		[ -z "${pass}" ] || break

		msg "Waiting...$i"
		msg "${log}"
		i=$(doubling_backoff_retry $i)
		;;
	    *)
		#		msg "${log}"
		break
		;;
	esac
    done

    echo $pass
}

##############################################################################
#
# Look up RDS Pass in stack_name at Output position stack_output_var
# if found return else generate a new one of length rds_admin_pw_length
#
# Args:
#
# Output:
#  rds pass
#
##############################################################################
rds_pass_get() {
    local stack_name="$1"
    local stack_output_var="$2"
    local pw_len="$3"

    local pass=$(aws_stack_output_query_by_name "${stack_name}" "${stack_output_var}")
    local pw
    if [ -n "${pass}" ]; then
	pw=$pass
    else
	pw=$(make_password "${pw_len}")
    fi

    echo $pw
}

##############################################################################
#
# Map Engine to Port for RDS.
#
# Args:
#   engine               - MySQL|mariadb|aurora
#                          oracle-se1|oracle-se|oracle-ee|
#                          sqlserver-ee|sqlserver-se|sqlserver-ex|sqlserver-web|
#                          postgres
#
# Output:
#  rds port #
#
##############################################################################
rds_port_for_engine() {
  local engine="$1"

  local rds_port
  case ${engine} in
     *sqlserver*)	     rds_port=1433 ;;
     *oracle*)               rds_port=1521 ;;
     *postgres*)             rds_port=5432 ;;
     *mysql|*maria*|*auroa*) rds_port=3306 ;;
  esac

  echo $rds_port
}

##############################################################################
#
# Run cf/sg.json.in after templatizing to make an SG.
#
# Args:
#  ingress
#  egress
#  name
#  resource_name
#  network_location
#
# Output:
#  Stack-Id in json or error msg
#
##############################################################################
sg_make() {
    local stack_prefix="$1"
    local app="$2"
    local owner_contact="$3"
    local env_code="$4"
    local custom_tags="$5"

    local vpc_id="$6"
    local ingress="$7"
    local egress="$8"
    local name="$9"
    local resource_name="${10}"
    local network_location="${11}"

    # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-security-group.html#cfn-ec2-securitygroup-securitygroupegress#d0e45604
    [ -z "${egress}" ] && egress='\{ "IpProtocol": "-1", "FromPort": "-1", "ToPort": "-1", "CidrIp": "127.0.0.1\/32" \}'

    local p1="SG_INGRESS=$ingress"
    local p2="SG_EGRESS=$egress"
    local p3="SG_RESOURCE_NAME=$resource_name"
    local fixes="\"{={%\" {={%}\"=}"

    local pairs="${p1}%${p2}%${p3}%${fixes}"
    local token_args=$(token_args_from_list "" "/" "%" "${pairs}")

    template_fill_in "${MY_CFDIR}/sg.json.in" "${MY_CFDIR}/sg.json" "quoted" "${token_args}"

    aws_stack_make "${stack_prefix}-${name}-SG" \
		   "${APP}" "${owner_contact}" "${env_code}" \
		   "${cf_dirs}" "sg.json" "std_tags" "${stack_prefix}" "${custom_tags}" \
		   "VPC=$vpc_id" \
		   "NetworkLocation=$network_location" \
		   "Name=$name"
}

##############################################################################
#
# Track Spot Request Cycle
#
# Args:
#  sir - spot request id
#
# Output:
#  none
#
##############################################################################
spot_fulfilled() {
    local sir="$1"

    local prev_code=
    local code=
    while [ x"$code" != x"fulfilled" ]; do
	local code=$(aws --output text ec2 describe-spot-instance-requests --spot-instance-request-ids $sir --query "SpotInstanceRequests[].Status.Code")
	if [ x"$prev_code" != x"$code" ]; then
	    elog "$prev_code -> $code"
	    prev_code=$code
	fi
	sleep 5
    done

    aws --output text ec2 describe-spot-instance-requests --spot-instance-request-ids $sir --query "SpotInstanceRequests[].InstanceId"

    echo $iid
}

##############################################################################
#
# Launches a spot instance
#
# Args:
#
# Output:
#  spot request id
#
##############################################################################
spot_launch() {
    local image_id="$1"
    local type="$2"
    local sg="$3"
    local subnet="$4"
    local price="$5"

    local json="{\"ImageId\":\"$image_id\",\"InstanceType\":\"$type\",\"NetworkInterfaces\":[{\"Groups\":[\"$sg\"],\"DeviceIndex\":0,\"SubnetId\":\"$subnet\"}], \"UserData\":\"hostname ; date ; uptime ; w ; netstat -nr ; arp -na ; ifconfig -a; env ; curl -L https://www.google.com\"}"

    aws --output text ec2 request-spot-instances \
	--spot-price "$price" \
	--instance-count 1 \
	--type "one-time" \
	--launch-specification "$json" \
	--query "SpotInstanceRequests[].SpotInstanceRequestId"
}

##############################################################################
#
# Connects via xfreedrdp (windows) or ssh (unix/linux) to any arbitrary EC2
# instance (preferably in an ASG) for the currently select ASV in IT.
# Lookup is based on a predictable tagging scheme.
#
# Args:
#   instance_id - ec2 instance id (works for emr ec2 too)
#   key_path    - path to priv peice of ssh or ec2 key pair
#
# Output:
#   status msgs
#   xfreerdp window or terminal changes to ssh on remote ec2
#
# TODO
#   bastions
#   TYPE selector
#   stack selector (waf, web, app, etl, rds)
#   rds, redshift
#   ssh tunnel or login
#
##############################################################################
do_connect() {
    local instance_id="$1"
    local key_path="$2"
    local type="$3"
    local rcli="$4"

    local ami_name=$(aws_ami_name_from_instance_id "${instance_id}")
    local user=$(aws_user_from_ami_name "${ami_name}")
    local name_tag=$(aws_instance_name "${instance_id}")
    local ip=$(aws_ec2_private_ip "${instance_id}")

    msg "tag(name): $name_tag"
    msg "instance_id: $instance_id"
    msg "ami name: $ami_name"
    msg "ip: $ip"
    msg "key: $key_name"
    msg "user: $user"

    local pass=$(password_admin_get "${instance_id}" "${ami_name}" "${key_path}")

    local i=1
    while [ true ]; do
	local log=$(aws_console_output "${instance_id}")

	case ${ami_name} in
	    *WIN*)
		pass=$(aws_ec2_get_password "${instance_id}" "${key_path}")
		[ -z "${pass}" ] || break

		msg "Waiting...$i"
		msg "${log}"
		i=$(doubling_backoff_retry $i)
		;;
	    *)
		#		msg "${log}"
		break
		;;
	esac
    done

    local cmd
    case ${ami_name} in
	*WIN*)
	    cmd="xfreerdp -g 1280x768 -u ${user} -p '${pass}' ${ip}"
	    ;;
	*)
	    cmd="ssh -i ${key_path} ${user}@${ip}"
	    ;;
    esac

    if [ -n "$rcli" ]; then
	cmd="$cmd \"$rcli\""
    fi
    debug "$cmd"
    eval "$cmd"
}

ssh_authorized_keys_set() {
    local home="$1"
    local bucket="$2"

    mkdir -p $home/ssh
    aws s3 sync s3://${bucket}/ssh $home/ssh
    cat $home/ssh/*.pub > $home/.ssh/authorized_keys
    rm -rf $home/ssh
}
##############################################################################
#
# Creates a TMPDIR/awsf.XXXXXX dir,
#   Checkouts out repo in dir @ ver
#
# Args:
#  uri  - any valid `git clone` uri
#  ver  - any valid `git co -b` value
#  repo - any valid GH org/proj
#
# Output:
#  full path to dir made
#
# NEEDS: PROXY vars setup for github
#
# SIDE EFFECTS:
#  dir is created and populated, user needs to clean up
#
##############################################################################
git_setup_dir() {
    local uri="$1"
    local ver="$2"
    local repo="$3"

    local safe_repo=$(echo $repo | sed -e 's,/,_,g')

    local prefix="${safe_repo}.XXX"

    local dir=$(mktemp -d -t $prefix)
    (
	cd ${dir}
	git clone -q ${uri} .
	if [ -n "${ver}" ]; then
	    git checkout -q ${ver}
	fi
    )

    echo ${dir}
}

################################################################################################
#
#
#
###############################################################################################
git_commit_file_to() {
    [ -z "${TEST_MODE}" ] || return

    local repo="$1"
    local original="$2"
    local dir="$3"
    local file="$4"
    local msg="$5"

    gh_or_fp "${repo}"
    local clone_dir=$(git_setup_dir "${GH}" "" "${repo}")

    mkdir -p ${clone_dir}/${dir}
    cp ${original} ${clone_dir}/${dir}/${file}
    (
	cd ${clone_dir}
	git add ${dir}/${file}
	git commit -m "${msg}"
	git push
    ) > /dev/null
    rm -rf ${clone_dir}
}

################################################################################################
#
# Determine if thing is an absolute path or relative GH repo
#
# Args:
#  thing - /path or org/proj[%ver]
#          %ver is optional, any valid g co -b ver will work
#
# SIDE EFFECTS: GH, GH_VER are set, GH_VER=%ver or default master
#
###############################################################################################
gh_or_fp() {
    local thing="$1"

    if [[ ${thing} = /* ]]; then
	GH_REPO=
	GH=
	GH_VER=
    else
	local org_proj=${thing%%%*}
	GH_REPO=${org_proj}
	GH="https://github.kdc.capitalone.com/${org_proj}"
	if [[ ${thing} = *%* ]]; then
	    GH_VER=${thing##*%}
	else
	    GH_VER=master
	fi
    fi
}

gh_oauth_token_get() {
    local eid="$1"
    local sso_pass="$2"
    local note="$3"

    local output=$(curl -X POST -s -u ${eid}:${sso_pass} -d '{"scopes": ["repo", "user"], "note": "'${note}'"}' ${gh_kdc_url}/api/v3/authorizations | egrep '"token"|"id"')

    local id=$(echo $output | awk '{ print $2 }' | sed -e 's/[", ]//g')
    local token=$(echo $output | awk '{ print $4 }' | sed -e 's/[", ]//g')

    GH_TOKEN=$token
    GH_TOKEN_ID=$id
}

gh_oauth_token_del() {
    local eid="$1"
    local sso_pass="$2"
    local id="$3"

    curl -X DELETE -s -u ${eid}:${sso_pass} ${gh_kdc_url}/api/v3/authorizations/$id
}
