aws_codecommit_blob_get() {
    local repository_name="$1"
    local blob_id="$2"
    shift 2

    log_and_run aws codecommit get-blob --repository-name $repository_name --blob-id $blob_id "$@"
}
