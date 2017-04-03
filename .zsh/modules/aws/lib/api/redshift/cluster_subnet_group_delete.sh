aws_redshift_cluster_subnet_group_delete() {
    local cluster_subnet_group_name="$1"
    shift 1

    cond_log_and_run aws redshift delete-cluster-subnet-group --cluster-subnet-group-name $cluster_subnet_group_name "$@"
}
