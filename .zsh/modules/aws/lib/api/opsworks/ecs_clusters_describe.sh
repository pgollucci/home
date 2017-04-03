aws_opsworks_ecs_clusters_describe() {
    shift 0

    log_and_run aws opsworks describe-ecs-clusters "$@"
}
