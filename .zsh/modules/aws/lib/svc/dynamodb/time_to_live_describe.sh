aws_dynamodb_time_to_live_describe() {
    local table-name="$1"
    shift 1

    log_and_run aws dynamodb  --table-name $table_name "@"

}
