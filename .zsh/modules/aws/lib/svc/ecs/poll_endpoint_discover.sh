aws_ecs_poll_endpoint_discover() {
    shift 0

    cond_log_and_run aws ecs  "@"

}
