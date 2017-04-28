aws_ecr_download_url_for_layer_get() {
    local repository_name="$1"
    local layer_digest="$2"
    shift 2

    log_and_run aws ecr get-download-url-for-layer --repository-name $repository_name --layer-digest $layer_digest "$@"
}
