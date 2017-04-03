aws_ecs_clusters_list() {
    shift 0

    log_and_run aws ecs list-clusters "$@"
}
