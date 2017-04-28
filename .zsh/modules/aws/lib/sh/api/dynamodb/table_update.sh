aws_dynamodb_table_update() {
    local table_name="$1"
    shift 1

    cond_log_and_run aws dynamodb update-table --table-name $table_name "$@"
}
