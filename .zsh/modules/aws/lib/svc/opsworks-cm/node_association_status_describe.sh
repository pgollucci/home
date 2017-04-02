aws_opsworks-cm_node_association_status_describe() {
    local server-name="$1"
    local node-association-status-token="$2"
    shift 2

    log_and_run aws opsworks-cm  --server-name $server_name --node-association-status-token $node_association_status_token "@"

}
