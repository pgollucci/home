aws_dynamodb_write_item_batch() {
    local request-items="$1"
    shift 1

    cond_log_and_run aws dynamodb  --request-items $request_items "@"

}
