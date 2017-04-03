aws_s3_sync() {
    shift 0

    cond_log_and_run aws s3 sync "$@"
}
