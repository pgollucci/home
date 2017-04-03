aws_kms_grant_create() {
    local key_id="$1"
    local grantee_principal="$2"
    shift 2

    cond_log_and_run aws kms create-grant --key-id $key_id --grantee-principal $grantee_principal "$@"
}
