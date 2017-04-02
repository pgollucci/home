aws_ec2_flow_logs_delete() {
    local flow-log-ids="$1"
    shift 1

    cond_log_and_run aws ec2  --flow-log-ids $flow_log_ids "@"

}
