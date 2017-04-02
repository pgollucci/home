aws_ec2_image_attribute_describe() {
    local attribute="$1"
    local image-id="$2"
    shift 2

    log_and_run aws ec2  --attribute $attribute --image-id $image_id "@"

}
