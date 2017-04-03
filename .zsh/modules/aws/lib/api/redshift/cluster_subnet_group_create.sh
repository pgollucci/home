aws_redshift_cluster_subnet_group_create() {
    local cluster_subnet_group_name="$1"
    local description="$2"
    local subnet_ids="$3"
    shift 3

    cond_log_and_run aws redshift create-cluster-subnet-group --cluster-subnet-group-name $cluster_subnet_group_name --description $description --subnet-ids $subnet_ids "$@"
}
