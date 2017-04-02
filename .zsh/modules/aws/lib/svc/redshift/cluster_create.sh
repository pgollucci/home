aws_redshift_cluster_create() {
    local node-type="$1"
    local master-username="$2"
    local cluster-identifier="$3"
    local master-user-password="$4"
    shift 4

    cond_log_and_run aws redshift  --node-type $node_type --master-username $master_username --cluster-identifier $cluster_identifier --master-user-password $master_user_password "@"

}
