aws_sts_target_source_prompt_info() { # GLOBAL

  local assumed=
  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
      assumed="ASSUMED:"
  fi
  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "   ${assumed}[$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_source_prompt_info() { # GLOBAL

  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
    echo "   SOURCE:[$AWS_SOURCE_DEFAULT_PROFILE($AWS_SOURCE_ENV/$SOURCE_ENV_LEVEL) - $AWS_SOURCE_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_prompt_info() { # GLOBAL

    local creds=$AWS_CREDENTIAL_FILE
    [ -e $creds ] || return

    local mtime=$(mtime "$creds")
    local now=$(now)
    local diff=$(($now-$mtime))

    if [ $diff -gt 7200 ]; then
        echo ""
    elif [ $diff -gt 3600 ]; then
	echo "   [${red}$diff${norm}s] \c"
    elif [ $diff -gt 3500 ]; then
	echo "   [${cyan}$diff${norm}s] \c"
    else
	echo "   [${green}$diff${norm}s] \c"
    fi
}

aws_sts_expire() { # GLOBAL

    if [ -r $AWS_ASSUMED_CREDENTIAL_FILE ]; then
	aws_sts_role_unassume
    fi

    time_ma_set "~/README.md" "$AWS_CREDENTIAL_FILE"
}

aws_sts_refresh() { # GLOBAL

    local _save_aws_default_profile=$AWS_DEFAULT_PROFILE

    aws_cfg_clear
    rm_file "$AWS_CREDENTIAL_FILE"

    local nicks=$(aws_util_nicks "$AWS_ORG" "$AWS_ACCOUNT_MAP")
    aws_sts_jc_refresh "$nicks" "$JC_EMAIL"
    aws_sts_map "$AWS_ORG"

    aws_shortcuts

    aws_sts_profiles_list "$AWS_CREDENTIAL_FILE"

    aws_cfg_profile "$_save_aws_default_profile"
}

aws_sts_profiles_list() {
    local cred_file="$1"

    grep_file "^\[" "$cred_file"
}

aws_sts_map() {
    local org="$1"

    sts_map.py $org
}

aws_sts_jc_refresh() {
    local nicks="$1"
    local saml_provider_email="$2"

    sts.py --provider jc --nicks "$nicks" --login $saml_provider_email --region us-east-1 --outputformat json
}

aws_sts_regions_disable() {
    local account_email="$1"

    # XXX: AWS API planned
    sts_regions_disable.py --login $account_email
}

aws_sts_root_keys_delete() {
    local account_email="$1"

    sts_root_keys_delete.py --login $account_email
}

aws_sts_root_mfa_enable() {
    local account_email="$1"

    sts_root_mfa_enable.py --login $account_email
}

aws_sts_cred_write() {
    local profile="$1"
    local region="$2"
    local output="$3"
    local aws_access_key_id="$4"
    local aws_secret_access_key="$5"
    local aws_session_token="$6"
    local expiration="$7"

    aws_iam_template_process "sts/profile" \
			     "PROFILE=$profile" \
			     "REGION=$region" \
			     "OUTPUT=$output" \
			     "AWS_ACCESS_KEY=$aws_access_key_id" \
			     "AWS_SECRET_ACCESS_KEY=$aws_secret_access_key" \
			     "AWS_SESSION_TOKEN=$aws_session_token" \
			     "EXPIRATION=$expiration"
}

aws_sts_role_assume() { # GLOBAL
    local profile="$1"
    local region="$2"
    local output="$3"
    local role_arn="$4"
    local role_session_name="$5"

    local json_file=$(_aws_sts_assume_json "$role_arn" "$role_session_name")

    local aws_access_key_id=$(json_key_2_value "AccessKeyId" "$json_file")
    local aws_secret_access_key=$(json_key_2_value "SecretAccessKey" "$json_file")
    local aws_session_token=$(json_key_2_value "SessionToken" "$json_file")
    local expiration=$(json_key_2_value "Expiration" "$json_file")

    transient_delete "$json_file"

    mv_file "$AWS_CREDENTIAL_FILE" "$AWS_SOURCE_CREDENTIAL_FILE"
    aws_sts_cred_write "$profile" "$region" "$output" "$aws_access_key_id" "$aws_secret_access_key" "$aws_session_token" "$expiration" > $AWS_ASSUMED_CREDENTIAL_FILE

    symlink "$AWS_ASSUMED_CREDENTIAL_FILE" "$AWS_CREDENTIAL_FILE"

    aws_cfg_clear

    aws_shortcut_set "$profile" "$region" "env" "type"
}

_aws_sts_assume_json() {
    local role_arn="$1"
    local role_session_name="$2"

    local dir=$(transient_create "aws.sts")
    local json_file=$dir/assume.json

    _aws_sts_role_assume "$role_arn" "$role_session_name" > $json_file
    if [ $? -ne 0 ]; then
	transient_delete "$json_file"
	return
    fi

    echo $json_file
}

_aws_sts_role_assume() {
    local role_arn="$1"
    local role_session_name="$2"

    aws sts assume-role --role-arn $role_arn --role-session-name $role_session_name
}

aws_sts_role_unassume() { # GLOBAL

    unlink_file "$AWS_CREDENTIAL_FILE"
    cp_file     "$AWS_SOURCE_CREDENTIAL_FILE"  "$AWS_CREDENTIAL_FILE"
    time_ma_set "$AWS_SOURCE_CREDENTIAL_FILE"  "$AWS_CREDENTIAL_FILE"
    rm_file     "$AWS_SOURCE_CREDENTIAL_FILE"  "$AWS_ASSUMED_CREDENTIAL_FILE"

    aws_cfg_set "$AWS_SOURCE_DEFAULT_PROFILE" "$AWS_SOURCE_DEFAULT_REGION" "$AWS_SOURCE_ENV" "$AWS_SOURCE_VPC" "$SOURCE_ENV_LEVEL"

    aws_cfg_source_clear
}

aws_sts_org_su() { # GLOBAL
    local account_alias="$1"
    local region="$2"
    local output="$3"
    local role_full_path="${4:-OrganizationAccountAccessRole}"

    local role_handle="role/${role_full_path}"
    local profile="${account_alias}+${role_handle}"

    local account_id=$(aws_util_account_alias_to_id "$account_alias" "$AWS_ACCOUNT_MAP")
    local role_arn="arn:aws:iam::${account_id}:${role_handle}"
    local role_session_name="p6cli"

    aws_sts_role_assume "$profile" "$region" "$output" "$role_arn" "$role_session_name"
}

aws_sts_account_current() {

    aws sts get-caller-identity | awk '/Arn/ { print $2 }' | cut -d: -f 5
}
