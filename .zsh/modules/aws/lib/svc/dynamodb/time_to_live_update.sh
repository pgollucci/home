aws_dynamodb_time_to_live_update() {
    local time-to-live-specification="$1"
    local table-name="$2"
    shift 2

    cond_log_and_run aws dynamodb  --time-to-live-specification $time_to_live_specification --table-name $table_name "@"

}
