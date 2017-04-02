aws_redshift_cluster_security_group_ingress_revoke() {
    local cluster-security-group-name="$1"
    shift 1

    cond_log_and_run aws redshift  --cluster-security-group-name $cluster_security_group_name "@"

}
