aws_ec2_instance_status_report() {
    local reason-codes="$1"
    local instances="$2"
    local status="$3"
    shift 3

    cond_log_and_run aws ec2  --reason-codes $reason_codes --instances $instances --status $status "@"

}
