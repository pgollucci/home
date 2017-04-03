aws_dynamodb_get_item_batch() {
    local request_items="$1"
    shift 1

    log_and_run aws dynamodb batch-get-item --request-items $request_items "$@"
}
