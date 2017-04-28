aws_ecs_service_create() {
    local service_name="$1"
    local task_definition="$2"
    local desired_count="$3"
    shift 3

    cond_log_and_run aws ecs create-service --service-name $service_name --task-definition $task_definition --desired-count $desired_count "$@"
}
