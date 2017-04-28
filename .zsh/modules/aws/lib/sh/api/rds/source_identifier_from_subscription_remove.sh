aws_rds_source_identifier_from_subscription_remove() {
    local subscription_name="$1"
    local source_identifier="$2"
    shift 2

    cond_log_and_run aws rds remove-source-identifier-from-subscription --subscription-name $subscription_name --source-identifier $source_identifier "$@"
}
