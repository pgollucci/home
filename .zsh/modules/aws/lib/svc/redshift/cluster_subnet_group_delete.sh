aws_redshift_cluster_subnet_group_delete() {
    local cluster-subnet-group-name="$1"
    shift 1

    cond_log_and_run aws redshift  --cluster-subnet-group-name $cluster_subnet_group_name "@"

}
