aws_glacier_provisioned_capacity_purchase() {
    local account-id="$1"
    shift 1

    cond_log_and_run aws glacier  --account-id $account_id "@"

}
