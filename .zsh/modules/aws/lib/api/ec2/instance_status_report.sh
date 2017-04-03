aws_ec2_instance_status_report() {
    local instances="$1"
    local status="$2"
    local reason_codes="$3"
    shift 3

    cond_log_and_run aws ec2 report-instance-status --instances $instances --status $status --reason-codes $reason_codes "$@"
}
