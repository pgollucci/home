aws_dynamodb_item_update() {
    local key="$1"
    local table-name="$2"
    shift 2

    cond_log_and_run aws dynamodb  --key $key --table-name $table_name "@"

}
