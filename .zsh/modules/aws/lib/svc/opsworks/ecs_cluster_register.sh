aws_opsworks_ecs_cluster_register() {
    local stack-id="$1"
    local ecs-cluster-arn="$2"
    shift 2

    cond_log_and_run aws opsworks  --stack-id $stack_id --ecs-cluster-arn $ecs_cluster_arn "@"

}
