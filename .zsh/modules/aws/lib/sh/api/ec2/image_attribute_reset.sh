aws_ec2_image_attribute_reset() {
    local attribute="$1"
    local image_id="$2"
    shift 2

    cond_log_and_run aws ec2 reset-image-attribute --attribute $attribute --image-id $image_id "$@"
}
