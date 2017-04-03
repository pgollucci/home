aws_s3_rm() {
    shift 0

    cond_log_and_run aws s3 rm "$@"
}
