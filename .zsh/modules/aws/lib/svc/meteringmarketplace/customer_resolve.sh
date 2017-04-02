aws_meteringmarketplace_customer_resolve() {
    local registration-token="$1"
    shift 1

    cond_log_and_run aws meteringmarketplace  --registration-token $registration_token "@"

}
