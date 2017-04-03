aws_logs_retention_policy_delete() {
    local log_group_name="$1"
    shift 1

    cond_log_and_run aws logs delete-retention-policy --log-group-name $log_group_name "$@"
}
