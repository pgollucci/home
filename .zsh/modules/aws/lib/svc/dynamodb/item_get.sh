aws_dynamodb_item_get() {
    local table-name="$1"
    local key="$2"
    shift 2

    log_and_run aws dynamodb  --table-name $table_name --key $key "@"

}
