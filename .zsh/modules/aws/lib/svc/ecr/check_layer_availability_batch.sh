aws_ecr_check_layer_availability_batch() {
    local repository-name="$1"
    local layer-digests="$2"
    shift 2

    cond_log_and_run aws ecr  --repository-name $repository_name --layer-digests $layer_digests "@"

}
