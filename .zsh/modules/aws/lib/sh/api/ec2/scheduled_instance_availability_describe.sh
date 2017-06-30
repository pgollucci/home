aws_ec2_scheduled_instance_availability_describe() {
    local first_slot_start_time_range="$1"
    local recurrence="$2"
    shift 2

    log_and_run aws ec2 describe-scheduled-instance-availability --first-slot-start-time-range $first_slot_start_time_range --recurrence $recurrence "$@"
}
