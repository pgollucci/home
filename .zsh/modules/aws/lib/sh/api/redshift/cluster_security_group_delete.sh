aws_redshift_cluster_security_group_delete() {
    local cluster_security_group_name="$1"
    shift 1

    cond_log_and_run aws redshift delete-cluster-security-group --cluster-security-group-name $cluster_security_group_name "$@"
}
