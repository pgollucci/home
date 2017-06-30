aws_ec2_instance_status_report() {
    local instances="$1"
    local reason_codes="$2"
    local status="$3"
    shift 3

    cond_log_and_run aws ec2 report-instance-status --instances $instances --reason-codes $reason_codes --status $status "$@"
}
