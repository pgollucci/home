aws_glacier_data_retrieval_policy_get() {
    local account_id="$1"
    shift 1

    log_and_run aws glacier get-data-retrieval-policy --account-id $account_id "$@"
}
