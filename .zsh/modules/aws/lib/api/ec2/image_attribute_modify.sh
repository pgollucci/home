aws_ec2_image_attribute_modify() {
    local image_id="$1"
    shift 1

    cond_log_and_run aws ec2 modify-image-attribute --image-id $image_id "$@"
}
