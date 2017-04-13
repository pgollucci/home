aws_s3api_buckets_list() {

    log_and_run aws s3api list-buckets "$@"
}
