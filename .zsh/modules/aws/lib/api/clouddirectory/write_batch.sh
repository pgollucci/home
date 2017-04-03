aws_clouddirectory_write_batch() {
    local directory_arn="$1"
    local operations="$2"
    shift 2

    cond_log_and_run aws clouddirectory batch-write --directory-arn $directory_arn --operations $operations "$@"
}
