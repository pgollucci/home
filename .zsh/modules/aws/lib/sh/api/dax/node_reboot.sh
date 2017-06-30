aws_dax_node_reboot() {
    local cluster_name="$1"
    local node_id="$2"
    shift 2

    cond_log_and_run aws dax reboot-node --cluster-name $cluster_name --node-id $node_id "$@"
}
