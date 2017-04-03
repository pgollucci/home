aws_inspector_agents_preview() {
    shift 0

    cond_log_and_run aws inspector preview-agents "$@"
}
