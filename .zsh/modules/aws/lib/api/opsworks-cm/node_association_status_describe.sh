aws_opsworks-cm_node_association_status_describe() {
    local node_association_status_token="$1"
    local server_name="$2"
    shift 2

    log_and_run aws opsworks-cm describe-node-association-status --node-association-status-token $node_association_status_token --server-name $server_name "$@"
}
