aws_ec2_password_data_get() {
    local instance_id="$1"
    shift 1

    log_and_run aws ec2 get-password-data --instance-id $instance_id "$@"
}
