aws_ecr_delete_image_batch() {
    local image-ids="$1"
    local repository-name="$2"
    shift 2

    cond_log_and_run aws ecr  --image-ids $image_ids --repository-name $repository_name "@"

}
