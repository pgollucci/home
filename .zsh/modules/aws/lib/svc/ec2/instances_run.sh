aws_ec2_instances_run() {
    local image-id="$1"
    shift 1

    cond_log_and_run aws ec2  --image-id $image_id "@"

}
