aws_dynamodb_item_update() {
    local table_name="$1"
    local key="$2"
    shift 2

    cond_log_and_run aws dynamodb update-item --table-name $table_name --key $key "$@"
}
