aws_dms_endpoint_create() {
    local endpoint_identifier="$1"
    local endpoint_type="$2"
    local engine_name="$3"
    shift 3

    cond_log_and_run aws dms create-endpoint --endpoint-identifier $endpoint_identifier --endpoint-type $endpoint_type --engine-name $engine_name "$@"
}
