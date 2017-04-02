aws_redshift_cluster_subnet_group_modify() {
    local cluster-subnet-group-name="$1"
    local subnet-ids="$2"
    shift 2

    cond_log_and_run aws redshift  --cluster-subnet-group-name $cluster_subnet_group_name --subnet-ids $subnet_ids "@"

}
