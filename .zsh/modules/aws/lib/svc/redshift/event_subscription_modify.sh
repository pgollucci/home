aws_redshift_event_subscription_modify() {
    local subscription-name="$1"
    shift 1

    cond_log_and_run aws redshift  --subscription-name $subscription_name "@"

}
