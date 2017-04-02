aws_snowball_cluster_describe() {
    local cluster-id="$1"
    shift 1

    log_and_run aws snowball  --cluster-id $cluster_id "@"

}
