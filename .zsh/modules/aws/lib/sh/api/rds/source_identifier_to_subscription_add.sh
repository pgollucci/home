aws_rds_source_identifier_to_subscription_add() {
    local subscription_name="$1"
    local source_identifier="$2"
    shift 2

    cond_log_and_run aws rds add-source-identifier-to-subscription --subscription-name $subscription_name --source-identifier $source_identifier "$@"
}
