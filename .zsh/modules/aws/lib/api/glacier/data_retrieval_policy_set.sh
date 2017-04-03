aws_glacier_data_retrieval_policy_set() {
    local account_id="$1"
    shift 1

    cond_log_and_run aws glacier set-data-retrieval-policy --account-id $account_id "$@"
}
