aws_glacier_data_retrieval_policy_get() {
    local account-id="$1"
    shift 1

    log_and_run aws glacier  --account-id $account_id "@"

}
