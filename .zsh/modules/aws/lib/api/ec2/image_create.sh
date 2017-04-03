aws_ec2_image_create() {
    local instance_id="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws ec2 create-image --instance-id $instance_id --name $name "$@"
}
