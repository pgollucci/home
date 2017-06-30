aws_dax_cluster_update() {
    local cluster_name="$1"
    shift 1

    cond_log_and_run aws dax update-cluster --cluster-name $cluster_name "$@"
}
