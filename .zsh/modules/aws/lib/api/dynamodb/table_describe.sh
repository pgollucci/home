aws_dynamodb_table_describe() {
    local table_name="$1"
    shift 1

    log_and_run aws dynamodb describe-table --table-name $table_name "$@"
}
