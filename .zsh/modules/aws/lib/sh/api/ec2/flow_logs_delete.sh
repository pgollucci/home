aws_ec2_flow_logs_delete() {
    local flow_log_ids="$1"
    shift 1

    cond_log_and_run aws ec2 delete-flow-logs --flow-log-ids $flow_log_ids "$@"
}
