aws_elasticbeanstalk_environment_managed_action_apply() {
    local action_id="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk apply-environment-managed-action --action-id $action_id "$@"
}
