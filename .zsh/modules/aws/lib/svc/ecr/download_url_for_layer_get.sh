aws_ecr_download_url_for_layer_get() {
    local layer-digest="$1"
    local repository-name="$2"
    shift 2

    log_and_run aws ecr  --layer-digest $layer_digest --repository-name $repository_name "@"

}
