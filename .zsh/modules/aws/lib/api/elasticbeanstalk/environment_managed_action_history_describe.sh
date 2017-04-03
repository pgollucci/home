aws_elasticbeanstalk_environment_managed_action_history_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-environment-managed-action-history "$@"
}
