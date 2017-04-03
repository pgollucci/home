aws_opsworks_ecs_cluster_deregister() {
    local ecs_cluster_arn="$1"
    shift 1

    cond_log_and_run aws opsworks deregister-ecs-cluster --ecs-cluster-arn $ecs_cluster_arn "$@"
}
