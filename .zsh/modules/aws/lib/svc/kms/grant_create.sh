aws_kms_grant_create() {
    local key-id="$1"
    local grantee-principal="$2"
    shift 2

    cond_log_and_run aws kms  --key-id $key_id --grantee-principal $grantee_principal "@"

}
