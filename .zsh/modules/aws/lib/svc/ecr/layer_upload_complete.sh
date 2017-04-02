aws_ecr_layer_upload_complete() {
    local repository-name="$1"
    local layer-digests="$2"
    local upload-id="$3"
    shift 3

    cond_log_and_run aws ecr  --repository-name $repository_name --layer-digests $layer_digests --upload-id $upload_id "@"

}
