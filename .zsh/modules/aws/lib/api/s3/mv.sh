aws_s3_mv() {
    shift 0

    cond_log_and_run aws s3 mv "$@"
}
