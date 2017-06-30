aws_ec2_image_copy() {
    local name="$1"
    local source_image_id="$2"
    local source_region="$3"
    shift 3

    cond_log_and_run aws ec2 copy-image --name $name --source-image-id $source_image_id --source-region $source_region "$@"
}
