aws_ec2_image_create() {
    local name="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws ec2  --name $name --instance-id $instance_id "@"

}
