aws_storagegateway_nfs_file_shares_describe() {
    local file_share_arn_list="$1"
    shift 1

    log_and_run aws storagegateway describe-nfs-file-shares --file-share-arn-list $file_share_arn_list "$@"
}
