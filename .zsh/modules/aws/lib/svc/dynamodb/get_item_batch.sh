aws_dynamodb_get_item_batch() {
    local request-items="$1"
    shift 1

    log_and_run aws dynamodb  --request-items $request_items "@"

}
