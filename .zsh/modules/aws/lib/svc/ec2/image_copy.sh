aws_ec2_image_copy() {
    local source-region="$1"
    local source-image-id="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws ec2  --source-region $source_region --source-image-id $source_image_id --name $name "@"

}
