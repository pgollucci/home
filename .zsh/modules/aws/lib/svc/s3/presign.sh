aws_s3_presign() {
    shift 0

    cond_log_and_run aws s3  "@"

}
