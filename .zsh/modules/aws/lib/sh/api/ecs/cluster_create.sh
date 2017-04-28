aws_ecs_cluster_create() {

    cond_log_and_run aws ecs create-cluster "$@"
}
