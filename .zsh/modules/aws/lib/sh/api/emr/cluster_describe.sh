aws_emr_cluster_describe() {
    local cluster_id="$1"
    shift 1

    log_and_run aws emr describe-cluster --cluster-id $cluster_id "$@"
}
