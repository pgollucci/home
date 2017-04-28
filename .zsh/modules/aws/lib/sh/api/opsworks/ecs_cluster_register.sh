aws_opsworks_ecs_cluster_register() {
    local ecs_cluster_arn="$1"
    local stack_id="$2"
    shift 2

    cond_log_and_run aws opsworks register-ecs-cluster --ecs-cluster-arn $ecs_cluster_arn --stack-id $stack_id "$@"
}
