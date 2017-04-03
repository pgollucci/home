aws_s3api_buckets_list() {
    shift 0

    log_and_run aws s3api list-buckets "$@"
}
