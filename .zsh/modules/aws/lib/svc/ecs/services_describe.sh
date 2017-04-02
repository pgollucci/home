aws_ecs_services_describe() {
    local services="$1"
    shift 1

    log_and_run aws ecs  --services $services "@"

}
