aws_ecs_clusters_list() {

    log_and_run aws ecs list-clusters "$@"
}
