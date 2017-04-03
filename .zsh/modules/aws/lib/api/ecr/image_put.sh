aws_ecr_image_put() {
    local repository_name="$1"
    local image_manifest="$2"
    shift 2

    cond_log_and_run aws ecr put-image --repository-name $repository_name --image-manifest $image_manifest "$@"
}
