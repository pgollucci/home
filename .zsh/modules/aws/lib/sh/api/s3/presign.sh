aws_s3_presign() {

    cond_log_and_run aws s3 presign "$@"
}
