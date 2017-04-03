aws_meteringmarketplace_customer_resolve() {
    local registration_token="$1"
    shift 1

    cond_log_and_run aws meteringmarketplace resolve-customer --registration-token $registration_token "$@"
}
