aws_ecr_images_describe() {
    local repository-name="$1"
    shift 1

    log_and_run aws ecr  --repository-name $repository_name "@"

}
