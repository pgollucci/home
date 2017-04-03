aws_snowball_clusters_list() {
    shift 0

    log_and_run aws snowball list-clusters "$@"
}
