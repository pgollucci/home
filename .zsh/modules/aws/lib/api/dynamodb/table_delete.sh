aws_dynamodb_table_delete() {
    local table_name="$1"
    shift 1

    cond_log_and_run aws dynamodb delete-table --table-name $table_name "$@"
}
