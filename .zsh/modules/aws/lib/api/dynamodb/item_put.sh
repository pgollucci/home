aws_dynamodb_item_put() {
    local table_name="$1"
    local item="$2"
    shift 2

    cond_log_and_run aws dynamodb put-item --table-name $table_name --item $item "$@"
}
