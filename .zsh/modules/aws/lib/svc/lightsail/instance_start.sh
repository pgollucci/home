aws_lightsail_instance_start() {
    local instance-name="$1"
    shift 1

    cond_log_and_run aws lightsail  --instance-name $instance_name "@"

}
