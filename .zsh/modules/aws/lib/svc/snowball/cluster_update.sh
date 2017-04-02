aws_snowball_cluster_update() {
    local cluster-id="$1"
    shift 1

    cond_log_and_run aws snowball  --cluster-id $cluster_id "@"

}
