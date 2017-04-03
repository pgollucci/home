aws_s3_ls() {
    shift 0

    cond_log_and_run aws s3 ls "$@"
}
