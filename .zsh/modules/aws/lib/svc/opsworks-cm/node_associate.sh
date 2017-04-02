aws_opsworks-cm_node_associate() {
    local engine-attributes="$1"
    local server-name="$2"
    local node-name="$3"
    shift 3

    cond_log_and_run aws opsworks-cm  --engine-attributes $engine_attributes --server-name $server_name --node-name $node_name "@"

}
