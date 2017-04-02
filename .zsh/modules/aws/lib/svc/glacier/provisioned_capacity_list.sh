aws_glacier_provisioned_capacity_list() {
    local account-id="$1"
    shift 1

    log_and_run aws glacier  --account-id $account_id "@"

}
