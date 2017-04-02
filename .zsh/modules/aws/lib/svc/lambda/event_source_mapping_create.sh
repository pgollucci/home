aws_lambda_event_source_mapping_create() {
    local starting-position="$1"
    local function-name="$2"
    local event-source-arn="$3"
    shift 3

    cond_log_and_run aws lambda  --starting-position $starting_position --function-name $function_name --event-source-arn $event_source_arn "@"

}
