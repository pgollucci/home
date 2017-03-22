aws_prompt_line() {

  local aws="$(aws_target_prompt_info)"
  local aws_source="$(aws_source_prompt_info)"
  local sts="$(aws_sts_prompt_info)"
  [ -n "$aws" ] && echo "${magenta}aws:${norm}$aws"
  [ -n "$aws_source" ] && echo "${magenta}aws:${norm}$aws_source"
  [ -n "$sts" ] && echo "${magenta}sts:${norm}$sts"
}

aws_target_prompt_info() {

  local assumed=
  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
      assumed="ASSUMED:"
  fi
  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "   ${assumed}[$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_source_prompt_info() {

  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
    echo "   SOURCE:[$AWS_SOURCE_DEFAULT_PROFILE($AWS_SOURCE_ENV/$SOURCE_ENV_LEVEL) - $AWS_SOURCE_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_prompt_info() {

    local creds=$HOME/.aws/credentials
    [ -e $creds ] || return

    local mtime=$(command stat -f "%m" $creds)
    local now=$(date "+%s")
    local diff=$(($now-$mtime))

    if [ $diff -gt 3500 ]; then
	echo "   [${red}$diff${norm}s] \c"
    else
	echo "   [${green}$diff${norm}s] \c"
    fi
}

aws_env_level() {

    export ENV_LEVEL=$1
}

aws_env() {
    local env="$1"

    export AWS_ENV=$env
}

aws_profile() {
    local profile="$1"

    export AWS_DEFAULT_PROFILE=$profile
    export AWS_PROFILE=$AWS_DEFAULT_PROFILE  # terraform
}

aws_region() {
    local region="$1"

    export AWS_DEFAULT_REGION=$region
}

aws_shortcut() {
    local profile="$1"
    local region="$2"
    local env="$3"
    local type="$4"

    aws_profile "$profile"
    aws_region "$region"
    aws_env "$env"
}

aws_clear() {
  alias aws && unalias aws
  unset AWS_DEFAULT_PROFILE
  unset AWS_PROFILE
  unset AWS_DEFAULT_REGION
  unset AWS_ENV
  unset AWS_VPC
  unset ENV_LEVEL
}

aws_show() {

    env |grep ^AWS_
}

aws_sts_expire() {

    if [ -r $HOME/.aws/credentials-assumed ]; then
	aws_sts_unassume_role
    fi

    touch -r ~/README.md ~/.aws/credentials
}

aws_sts() {

    local _save_aws_default_profile=$AWS_DEFAULT_PROFILE

    aws_clesr

    ~/bin/sts.py --provider jc --nicks "aws-p6" --login $JC_EMAIL
    ~/bin/sts_map.py p6

    aws_setup

    grep "^\[" ~/.aws/credentials

    export AWS_DEFAULT_PROFILE=$_save_aws_default_profile
}

aws_unset_shortcuts() {

    local func
    for func in $(typeset -f |awk '/^[a-z_0-9]+ \(\)/ { print $1 }' |grep awsa_); do
	unset $func
    done
}

aws_setup() {

    aws_unset_shortcuts

    local profile
    for profile in $(awk '/^\[/ { print }' < ~/.aws/credentials | grep -v default | sed -e 's,[][],,g'); do
	local account=$(echo $profile | cut -d'-' -f 1)

	eval "awsa_${account}() { aws_shortcut \"$profile\" \"us-east-1\" \"env\" \"type\" }"
    done
}

aws_awless_setup() {

  source <(awless completion zsh)
}

aws_sts_cred_write() {
    local file="$1"
    local profile="$2"
    local output="$3"
    local region="$4"
    local aws_access_key_id="$5"
    local aws_secret_access_key="$6"
    local aws_session_token="$7"

    cat << EOF > $file
# $expiration
[$account_name+role/${role_name}]
output = $output
region = $region
aws_access_key_id = $aws_access_key_id
aws_secret_access_key = $aws_secret_access_key
aws_session_token = $aws_session_token
EOF
}

aws_sts_assume_role() {
    local account_name="$1"
    local role_name="$2"

    local account_id=$(aws_name_to_id "${account_name}")
    local json_file=/tmp/${account_name}-${role_name}.json

    aws sts assume-role --role-arn arn:aws:iam::${account_id}:role/${role_name} --role-session-name "test" > $json_file

    local profile="$account_name+role/${role_name}"
    local region="us-east-1"
    local output="json"
    local aws_access_key_id=$(_util_json_key_2_value "AccessKeyId" "${json_file}")
    local aws_secret_access_key=$(_util_json_key_2_value "SecretAccessKey" "${json_file}")
    local aws_session_token=$(_util_json_key_2_value "SessionToken" "${json_file}")
    local expiration=$(_util_json_key_2_value "Expiration" "${json_file}")

    aws_sts_cred_write "$HOME/.aws/credentials-assumed" "$profile" "$refion" "$ouput" "$aws_access_key_id" "$aws_secret_access_key" "$aws_session_token" "$expiration"

    rm -f ${json_file}

    mv $HOME/.aws/credentials $HOME/.aws/credentials-orig
    ln -s $HOME/.aws/credentials-assumed $HOME/.aws/credentials

    export AWS_SOURCE_DEFAULT_PROFILE=$AWS_DEFAULT_PROFILE
    export AWS_SOURCE_PROFILE=$AWS_PROFILE
    export AWS_SOURCE_DEFAULT_REGION=$AWS_DEFAULT_REGION
    export AWS_SOURCE_ENV=$AWS_ENV
    export AWS_SOURCE_VPC=$AWS_VPC
    export SOURCE_ENV_LEVEL=$ENV_LEVEL

    aws_clear

    aws_shortcut "${profile}" "${region}" "env" "type"
}

aws_sts_unassume_role() {

    rm -f $HOME/.aws/credentials-assumed
    cp $HOME/.aws/credentials-orig $HOME/.aws/credentials
    touch -r $HOME/.aws/credentials-orig $HOME/.aws/credentials
    rm -f $HOME/.aws/credentials-orig

    export AWS_DEFAULT_PROFILE=$AWS_SOURCE_DEFAULT_PROFILE
    export AWS_PROFILE=$AWS_SOURCE_PROFILE
    export AWS_DEFAULT_REGION=$AWS_SOURCE_DEFAULT_REGION
    export AWS_ENV=$AWS_SOURCE_ENV
    export AWS_VPC=$AWS_SOURCE_VPC
    export ENV_LEVEL=$SOURCE_ENV_LEVEL

    unset AWS_SOURCE_DEFAULT_PROFILE
    unset AWS_SOURCE_PROFILE
    unset AWS_SOURCE_DEFAULT_REGION
    unset AWS_SOURCE_ENV
    unset AWS_SOURCE_VPC
    unset SOURCE_ENV_LEVEL
}

aws_name_to_id() {
    local account_name="$1"

    _util_json_value_2_key "${account_name}" "$HOME/.aws/map-p6"
}

_util_json_key_2_value() {
    local key="$1"
    local file="$2"

    awk -v k=$key '$1 ~ k { print $2 }' < $file | sed -e 's/[",:]//g'
}

_util_json_value_2_key() {
    local key="$1"
    local file="$2"

    awk -v k=$key '$2 ~ k { print $1 }' < $file | sed -e 's/[",:]//g'
}

__setup() {

    alias sts='aws_sts'

    aws_setup

    aws_awless_setup
}

__setup
