aws_redshift_cluster_iam_roles_modify() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift modify-cluster-iam-roles --cluster-identifier $cluster_identifier "$@"
}
