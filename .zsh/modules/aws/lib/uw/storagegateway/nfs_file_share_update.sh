aws_storagegateway_encrypted() {
        local file_share_arn="$1"
        shift 1

    cond_log_and_run aws storagegateway update-nfs-file-share --file-share-arn $file_share_arn --kms-encrypted "$@"
}

