aws_redshift_cluster_delete() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift delete-cluster --cluster-identifier $cluster_identifier "$@"
}
