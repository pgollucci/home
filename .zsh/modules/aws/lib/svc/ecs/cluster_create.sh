aws_ecs_cluster_create() {
    shift 0

    cond_log_and_run aws ecs  "@"

}
