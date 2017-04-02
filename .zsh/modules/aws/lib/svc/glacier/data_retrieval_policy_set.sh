aws_glacier_data_retrieval_policy_set() {
    local account-id="$1"
    shift 1

    cond_log_and_run aws glacier  --account-id $account_id "@"

}
