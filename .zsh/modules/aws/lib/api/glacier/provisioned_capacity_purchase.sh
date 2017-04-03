aws_glacier_provisioned_capacity_purchase() {
    local account_id="$1"
    shift 1

    cond_log_and_run aws glacier purchase-provisioned-capacity --account-id $account_id "$@"
}
