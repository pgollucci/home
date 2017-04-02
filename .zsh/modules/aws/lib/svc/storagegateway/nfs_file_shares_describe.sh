aws_storagegateway_nfs_file_shares_describe() {
    local file-share-arn-list="$1"
    shift 1

    log_and_run aws storagegateway  --file-share-arn-list $file_share_arn_list "@"

}
