aws_storagegateway_tape_archive_delete() {
    local tape-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --tape-arn $tape_arn "@"

}
