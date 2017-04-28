aws_emr_cluster_attributes_modify() {
    local cluster_id="$1"
    shift 1

    cond_log_and_run aws emr modify-cluster-attributes --cluster-id $cluster_id "$@"
}
