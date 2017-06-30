aws_dax_cluster_create() {
    local cluster_name="$1"
    local node_type="$2"
    local replication_factor="$3"
    local iam_role_arn="$4"
    shift 4

    cond_log_and_run aws dax create-cluster --cluster-name $cluster_name --node-type $node_type --replication-factor $replication_factor --iam-role-arn $iam_role_arn "$@"
}
