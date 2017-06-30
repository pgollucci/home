aws_ec2_image_attribute_describe() {
    local attribute="$1"
    local image_id="$2"
    shift 2

    log_and_run aws ec2 describe-image-attribute --attribute $attribute --image-id $image_id "$@"
}
