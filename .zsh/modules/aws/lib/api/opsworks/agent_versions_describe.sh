aws_opsworks_agent_versions_describe() {
    shift 0

    log_and_run aws opsworks describe-agent-versions "$@"
}
