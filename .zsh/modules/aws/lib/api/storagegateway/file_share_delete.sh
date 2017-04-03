aws_storagegateway_file_share_delete() {
    local file_share_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway delete-file-share --file-share-arn $file_share_arn "$@"
}
