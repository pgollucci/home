aws_ec2_image_deregister() {
    local image_id="$1"
    shift 1

    cond_log_and_run aws ec2 deregister-image --image-id $image_id "$@"
}
