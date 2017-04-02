aws_ec2_console_output_get() {
    local instance-id="$1"
    shift 1

    log_and_run aws ec2  --instance-id $instance_id "@"

}
