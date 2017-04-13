aws_s3_sync() {

    cond_log_and_run aws s3 sync "$@"
}
