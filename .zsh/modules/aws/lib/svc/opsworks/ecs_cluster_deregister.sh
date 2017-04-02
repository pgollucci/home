aws_opsworks_ecs_cluster_deregister() {
    local ecs-cluster-arn="$1"
    shift 1

    cond_log_and_run aws opsworks  --ecs-cluster-arn $ecs_cluster_arn "@"

}
