aws_deploy_wait_time_for_instance_termination_skip() {
    shift 0

    cond_log_and_run aws deploy  "@"

}
