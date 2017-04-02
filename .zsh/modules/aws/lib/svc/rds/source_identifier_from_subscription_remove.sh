aws_rds_source_identifier_from_subscription_remove() {
    local subscription-name="$1"
    local source-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --subscription-name $subscription_name --source-identifier $source_identifier "@"

}
