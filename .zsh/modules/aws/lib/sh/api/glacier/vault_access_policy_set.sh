aws_glacier_vault_access_policy_set() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    cond_log_and_run aws glacier set-vault-access-policy --account-id $account_id --vault-name $vault_name "$@"
}
