aws_codecommit_blob_get() {
    local blob-id="$1"
    local repository-name="$2"
    shift 2

    log_and_run aws codecommit  --blob-id $blob_id --repository-name $repository_name "@"

}
