aws_emr_clusters_list() {

    log_and_run aws emr list-clusters "$@"
}
