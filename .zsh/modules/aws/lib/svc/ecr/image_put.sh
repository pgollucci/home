aws_ecr_image_put() {
    local image-manifest="$1"
    local repository-name="$2"
    shift 2

    cond_log_and_run aws ecr  --image-manifest $image_manifest --repository-name $repository_name "@"

}
