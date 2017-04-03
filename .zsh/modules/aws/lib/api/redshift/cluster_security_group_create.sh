aws_redshift_cluster_security_group_create() {
    local cluster_security_group_name="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws redshift create-cluster-security-group --cluster-security-group-name $cluster_security_group_name --description $description "$@"
}
