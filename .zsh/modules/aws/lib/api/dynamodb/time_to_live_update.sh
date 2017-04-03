aws_dynamodb_time_to_live_update() {
    local table_name="$1"
    local time_to_live_specification="$2"
    shift 2

    cond_log_and_run aws dynamodb update-time-to-live --table-name $table_name --time-to-live-specification $time_to_live_specification "$@"
}
