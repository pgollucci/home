aws_dynamodb_table_update() {
    local table-name="$1"
    shift 1

    cond_log_and_run aws dynamodb  --table-name $table_name "@"

}
