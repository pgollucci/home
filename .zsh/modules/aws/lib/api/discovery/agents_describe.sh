aws_discovery_agents_describe() {
    shift 0

    log_and_run aws discovery describe-agents "$@"
}
