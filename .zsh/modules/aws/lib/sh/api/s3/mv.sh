aws_s3_mv() {

    cond_log_and_run aws s3 mv "$@"
}
