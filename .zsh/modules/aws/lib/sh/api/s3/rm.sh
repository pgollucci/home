aws_s3_rm() {

    cond_log_and_run aws s3 rm "$@"
}
