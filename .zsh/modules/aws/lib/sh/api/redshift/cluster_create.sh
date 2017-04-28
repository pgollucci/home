aws_redshift_cluster_create() {
    local cluster_identifier="$1"
    local node_type="$2"
    local master_username="$3"
    local master_user_password="$4"
    shift 4

    cond_log_and_run aws redshift create-cluster --cluster-identifier $cluster_identifier --node-type $node_type --master-username $master_username --master-user-password $master_user_password "$@"
}
