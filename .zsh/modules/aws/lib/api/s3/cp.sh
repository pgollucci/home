aws_s3_cp() {

    cond_log_and_run aws s3 cp "$@"
}
