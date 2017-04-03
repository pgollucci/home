aws_opsworks-cm_server_engine_attributes_update() {
    local server_name="$1"
    local attribute_name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm update-server-engine-attributes --server-name $server_name --attribute-name $attribute_name "$@"
}
