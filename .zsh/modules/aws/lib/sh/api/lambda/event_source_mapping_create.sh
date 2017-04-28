aws_lambda_event_source_mapping_create() {
    local event_source_arn="$1"
    local function_name="$2"
    local starting_position="$3"
    shift 3

    cond_log_and_run aws lambda create-event-source-mapping --event-source-arn $event_source_arn --function-name $function_name --starting-position $starting_position "$@"
}
