aws_logs_destination_policy_put() {
    local access-policy="$1"
    local destination-name="$2"
    shift 2

    cond_log_and_run aws logs  --access-policy $access_policy --destination-name $destination_name "@"

}
