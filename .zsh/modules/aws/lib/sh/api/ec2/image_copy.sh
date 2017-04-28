aws_ec2_image_copy() {
    local source_region="$1"
    local source_image_id="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws ec2 copy-image --source-region $source_region --source-image-id $source_image_id --name $name "$@"
}
