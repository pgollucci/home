aws_snowball_cluster_jobs_list() {
    local cluster-id="$1"
    shift 1

    log_and_run aws snowball  --cluster-id $cluster_id "@"

}
