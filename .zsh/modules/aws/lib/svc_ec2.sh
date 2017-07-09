aws_ec2_keypair_make() {
  local dir="$1"
  local name="$2"

  aws ec2 describe-key-pairs --key-name "$name" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
      if [ ! -f $dir/$name ]; then
	  aws ec2 delete-key-pair --key-name "$name" 2>&1 >/dev/null
	  [ -d $dir ] || mkdir -p $dir
	  aws ec2 create-key-pair --key-name "$name" --query KeyMaterial | perl -p -e 's,",,g ; s,\\n,\n,g' > $dir/$name
      fi
  else
      aws ec2 create-key-pair --key-name "$name" --query KeyMaterial | perl -p -e 's,",,g ; s,\\n,\n,g' > $dir/$name
  fi
}

aws_ec2_keypair_del() {
  local dir="$1"
  local name="$2"

  aws ec2 delete-key-pair --key-name "$name"
  rm -f $dir/$name
}

aws_ec2_instance_id_from_name_tag() {
  local name="$1"

  aws --output text ec2 \
      describe-instances --filters Name=tag:Name,Values="*$name*" \
      --query 'Reservations[].Instances[].[LaunchTime,InstanceId]' | \
      sort -n | awk '{ print $2 }' | tail -1
}

aws_ec2_private_ip() {
  local instance_id="$1"

  aws --output text ec2 \
      describe-instances --instance-ids $instance_id \
      --query "Reservations[0].Instances[0].PrivateIpAddress"
}

aws_ec2_public_dns_name() {
  local instance_id="$1"

  aws --output text ec2 \
      describe-instances --instance-ids $instance_id \
      --query "Reservations[0].Instances[0].PublicDnsName"
}

aws_ec2_key_name() {
  local instance_id="$1"

  aws --output text ec2 \
      describe-instances --instance-id $instance_id --query "Reservations[0].Instances[0].KeyName"
}

aws_ec2_password_get() {
  local instance_id="$1"
  local key_path="$2"

  aws --output ec2 \
      get-password-data --instance-id $instance_id --priv-launch-key $key_path \
      --query "PasswordData"
}

aws_ec2_user_from_ami_name() {
    local ami_name="$1"

    local user
    case $ami_name in
	*WIN*)     user=lanadmin ;;
	*RHEL*)    user=ec2-user ;;
	*qubole*|*AmazonLinux*) user=ec2-user ;;
	*Ubuntu*)  user=ubuntu   ;;
	*core*)    user=core     ;;

    esac

    echo $user
}

aws_ec2_copy_ami() {
    local source_region="$1"
    local source_ami_id="$2"
    local kms_key_id="$3"
    local target_region="$4"
    local target_name="$5"
    local target_description="$6"

    cond_run aws --output text ec2 copy-image \
	--source-region $source_region \
	--source-image-id $source_ami_id \
	--region $target_region \
	--name $target_name \
	--description "\"$target_description\"" \
	--encrypted \
	--kms-key-id $kms_key_id
}

aws_ec2_ami_find_id() {
  local glob="$1"

  aws --output text ec2 describe-images \
      --owners self --filters "Name=name,Values=$glob" \
      --query "Images[*].[Name,ImageId]" | \
      sort -k 1,1 | tail -1 | awk '{ print $2 }'
}

aws_ec2_ami_id_from_instance_id() {
    local instance_id="$1"

    aws --output text ec2 describe-instances \
	--instance-ids $instance_id --query "Reservations[0].Instances[0].ImageId"
}

aws_ec2_ami_name_from_instance_id() {
  local instance_id="$1"

  local ami_id=$(aws_ec2_ami_id_from_instance_id "$instance_id")

  aws --output text ec2 describe-images \
		     --image-ids $ami_id --query "Images[0].Name"

}

aws_ec2_console_output() {
  local instance_id="$1"

  aws --output text ec2 get-console-output --instance-id $instance_id
}
