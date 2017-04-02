aws_dynamodbstreams_stream_describe() {
    local stream-arn="$1"
    shift 1

    log_and_run aws dynamodbstreams  --stream-arn $stream_arn "@"

}
