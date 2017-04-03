aws_redshift_cluster_subnet_group_modify() {
    local cluster_subnet_group_name="$1"
    local subnet_ids="$2"
    shift 2

    cond_log_and_run aws redshift modify-cluster-subnet-group --cluster-subnet-group-name $cluster_subnet_group_name --subnet-ids $subnet_ids "$@"
}
