aws_redshift_cluster_security_group_ingress_revoke() {
    local cluster_security_group_name="$1"
    shift 1

    cond_log_and_run aws redshift revoke-cluster-security-group-ingress --cluster-security-group-name $cluster_security_group_name "$@"
}
