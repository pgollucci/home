aws_logs_destination_policy_put() {
    local destination_name="$1"
    local access_policy="$2"
    shift 2

    cond_log_and_run aws logs put-destination-policy --destination-name $destination_name --access-policy $access_policy "$@"
}
