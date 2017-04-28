aws_storagegateway_nfs_file_share_update() {
    local file_share_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway update-nfs-file-share --file-share-arn $file_share_arn "$@"
}
