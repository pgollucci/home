aws_ec2_image_attribute_describe() {
    local image_id="$1"
    local attribute="$2"
    shift 2

    log_and_run aws ec2 describe-image-attribute --image-id $image_id --attribute $attribute "$@"
}
