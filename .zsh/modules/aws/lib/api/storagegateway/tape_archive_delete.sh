aws_storagegateway_tape_archive_delete() {
    local tape_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway delete-tape-archive --tape-arn $tape_arn "$@"
}
