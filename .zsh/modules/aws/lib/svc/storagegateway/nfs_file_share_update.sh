aws_storagegateway_nfs_file_share_update() {
    local file-share-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --file-share-arn $file_share_arn "@"

}
