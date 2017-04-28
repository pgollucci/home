aws_opsworks-cm_node_disassociate() {
    local server_name="$1"
    local node_name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm disassociate-node --server-name $server_name --node-name $node_name "$@"
}
