aws_dynamodb_item_get() {
    local table_name="$1"
    local key="$2"
    shift 2

    log_and_run aws dynamodb get-item --table-name $table_name --key $key "$@"
}
