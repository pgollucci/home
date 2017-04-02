aws_apigateway_export_get() {
    local stage-name="$1"
    local rest-api-id="$2"
    local export-type="$3"
    shift 3

    log_and_run aws apigateway  --stage-name $stage_name --rest-api-id $rest_api_id --export-type $export_type "@"

}
