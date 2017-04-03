aws_dynamodb_time_to_live_describe() {
    local table_name="$1"
    shift 1

    log_and_run aws dynamodb describe-time-to-live --table-name $table_name "$@"
}
