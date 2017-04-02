aws_opsworks-cm_server_engine_attributes_update() {
    local attribute-name="$1"
    local server-name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm  --attribute-name $attribute_name --server-name $server_name "@"

}
