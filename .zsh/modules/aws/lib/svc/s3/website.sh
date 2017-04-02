aws_s3_website() {
    shift 0

    cond_log_and_run aws s3  "@"

}
