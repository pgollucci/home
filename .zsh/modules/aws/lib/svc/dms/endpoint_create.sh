aws_dms_endpoint_create() {
    local endpoint-identifier="$1"
    local engine-name="$2"
    local endpoint-type="$3"
    shift 3

    cond_log_and_run aws dms  --endpoint-identifier $endpoint_identifier --engine-name $engine_name --endpoint-type $endpoint_type "@"

}
