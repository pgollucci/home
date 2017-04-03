aws_dynamodbstreams_stream_describe() {
    local stream_arn="$1"
    shift 1

    log_and_run aws dynamodbstreams describe-stream --stream-arn $stream_arn "$@"
}
