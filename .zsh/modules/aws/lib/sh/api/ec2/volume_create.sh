aws_ec2_volume_create() {
    local availability_zone="$1"
    shift 1

    cond_log_and_run aws ec2 create-volume --availability-zone $availability_zone "$@"
}
