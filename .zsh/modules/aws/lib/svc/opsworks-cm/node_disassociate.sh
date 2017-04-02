aws_opsworks-cm_node_disassociate() {
    local server-name="$1"
    local node-name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm  --server-name $server_name --node-name $node_name "@"

}
