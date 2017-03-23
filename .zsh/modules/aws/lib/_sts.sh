aws_sts_target_source_prompt_info() {

  local assumed=
  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
      assumed="ASSUMED:"
  fi
  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "   ${assumed}[$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_source_prompt_info() {

  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
    echo "   SOURCE:[$AWS_SOURCE_DEFAULT_PROFILE($AWS_SOURCE_ENV/$SOURCE_ENV_LEVEL) - $AWS_SOURCE_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_prompt_info() {

    local creds=$AWS_CREDENTIAL_FILE
    [ -e $creds ] || return

    local mtime=$(command stat -f "%m" $creds)
    local now=$(date "+%s")
    local diff=$(($now-$mtime))

    if [ $diff -gt 3600 ]; then
	echo "   [${red}$diff${norm}s] \c"
    elif [ $diff -gt 3500 ]; then
	echo "   [${cyan}$diff${norm}s] \c"
    else
	echo "   [${green}$diff${norm}s] \c"
    fi
}

aws_sts_expire() {

    if [ -r $AWS_CREDENTIAL_FILE-assumed ]; then
	aws_sts_unassume_role
    fi

    touch -r ~/README.md $AWS_CREDENTIAL_FILE
}

aws_sts_refresh() {

    local _save_aws_default_profile=$AWS_DEFAULT_PROFILE

    aws_cfg_clear
    rm -f $AWS_CREDENTIAL_FILE

    sts.py --provider jc --nicks "aws-${AWS_ORG}" --login $JC_EMAIL
    sts_map.py ${AWS_ORG}

    aws_setup

    grep "^\[" $AWS_CREDENTIAL_FILE

    export AWS_DEFAULT_PROFILE=$_save_aws_default_profile
}

aws_sts_cred_write() {
    local file="$1"
    local account_name="$2"
    local role_name="$3"
    local profile="$4"
    local output="$5"
    local region="$6"
    local aws_access_key_id="$7"
    local aws_secret_access_key="$8"
    local aws_session_token="$9"
    local expiration="${10}"

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

    local account_id=$(_util_account_name_to_id "${account_name}")
    local json_file=/tmp/${account_name}-${role_name}.json

    aws sts assume-role --role-arn arn:aws:iam::${account_id}:role/${role_name} --role-session-name "test" > $json_file
    [ $? -ne 0 ] && return

    local profile="$account_name+role/${role_name}"
    local region="us-east-1"
    local output="json"
    local aws_access_key_id=$(_util_json_key_2_value "AccessKeyId" "${json_file}")
    local aws_secret_access_key=$(_util_json_key_2_value "SecretAccessKey" "${json_file}")
    local aws_session_token=$(_util_json_key_2_value "SessionToken" "${json_file}")
    local expiration=$(_util_json_key_2_value "Expiration" "${json_file}")

    aws_sts_cred_write "$AWS_CREDENTIAL_FILE-assumed" "$account_name" "$role_name" "$profile" "$output" "$region" "$aws_access_key_id" "$aws_secret_access_key" "$aws_session_token" "$expiration"

    rm -f ${json_file}

    mv $AWS_CREDENTIAL_FILE $AWS_CREDENTIAL_FILE-orig
    ln -s $AWS_CREDENTIAL_FILE-assumed $AWS_CREDENTIAL_FILE

    export AWS_SOURCE_DEFAULT_PROFILE=$AWS_DEFAULT_PROFILE
    export AWS_SOURCE_PROFILE=$AWS_PROFILE
    export AWS_SOURCE_DEFAULT_REGION=$AWS_DEFAULT_REGION
    export AWS_SOURCE_ENV=$AWS_ENV
    export AWS_SOURCE_VPC=$AWS_VPC
    export SOURCE_ENV_LEVEL=$ENV_LEVEL

    aws_cfg_clear

    aws_shortcut_set "${profile}" "${region}" "env" "type"
}

aws_sts_unassume_role() {

    unlink $AWS_CREDENTIAL_FILE
    cp $AWS_CREDENTIAL_FILE-orig $AWS_CREDENTIAL_FILE
    touch -r $AWS_CREDENTIAL_FILE-orig $AWS_CREDENTIAL_FILE
    rm -f $AWS_CREDENTIAL_FILE-orig $AWS_CREDENTIAL_FILE-assumed

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

aws_sts_org_su() {
    local account_name="$1"

    aws_sts_assume_role "${account_name}" "OrganizationAccountAccessRole"
}
