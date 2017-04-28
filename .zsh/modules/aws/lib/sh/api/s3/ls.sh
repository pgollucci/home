aws_s3_ls() {

    cond_log_and_run aws s3 ls "$@"
}
