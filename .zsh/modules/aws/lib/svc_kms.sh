aws_kms_key_make() {
    local account_id="$1"
    local key_description="$2"
    local key_alias="$3"

    local key_admin_principals="arn:aws:iam::${account_id}:role/SSO/SSO_Admin"
    local key_user_principals="arn:aws:iam::${account_id}:role/SSO/SSO_Admin"

    local key_policy=$(aws_iam_template_process "iam/kms" "ACCOUNT_ID=$account_id" "KEY_ADMIN_PRINCIPALS=$key_admin_principals" "KEY_USER_PRINCIPALS=$key_user_principals")

    local key_id=$(aws_kms_key_create "$key_description" "$key_policy")
    aws_kms_key_alias "$key_alias" "$key_id"
}

aws_kms_key_create() {
    local key_description="$1"
    local key_policy="$2"

    aws kms create-key --description $key_description --policy $key_policy | json_key_2_value "KeyId" "-"
}

aws_kms_key_alias() {
    local alias_name="$1"
    local target_key_id="$2"

    aws kms create-alias --alias-name $alias_name --target-key-id $target_key_id
}
