aws_s3api_objects_v2_list() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api  --bucket $bucket "@"

}
