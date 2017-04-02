aws_storagegateway_file_share_delete() {
    local file-share-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --file-share-arn $file_share_arn "@"

}
