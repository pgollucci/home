aws_s3_cp() {
    shift 0

    cond_log_and_run aws s3 cp "$@"
}
