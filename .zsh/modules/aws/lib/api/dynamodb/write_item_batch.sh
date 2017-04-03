aws_dynamodb_write_item_batch() {
    local request_items="$1"
    shift 1

    cond_log_and_run aws dynamodb batch-write-item --request-items $request_items "$@"
}
