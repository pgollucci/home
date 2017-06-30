aws_dax_cluster_delete() {
    local cluster_name="$1"
    shift 1

    cond_log_and_run aws dax delete-cluster --cluster-name $cluster_name "$@"
}
