aws_ecs_poll_endpoint_discover() {

    cond_log_and_run aws ecs discover-poll-endpoint "$@"
}
