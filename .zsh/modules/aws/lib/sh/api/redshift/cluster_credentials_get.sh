aws_redshift_cluster_credentials_get() {
    local db_user="$1"
    local cluster_identifier="$2"
    shift 2

    log_and_run aws redshift get-cluster-credentials --db-user $db_user --cluster-identifier $cluster_identifier "$@"
}
