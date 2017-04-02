aws_ecs_service_create() {
    local service-name="$1"
    local desired-count="$2"
    local task-definition="$3"
    shift 3

    cond_log_and_run aws ecs  --service-name $service_name --desired-count $desired_count --task-definition $task_definition "@"

}
