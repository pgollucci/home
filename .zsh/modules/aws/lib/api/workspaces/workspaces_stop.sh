aws_workspaces_workspaces_stop() {
    local stop_workspace_requests="$1"
    shift 1

    cond_log_and_run aws workspaces stop-workspaces --stop-workspace-requests $stop_workspace_requests "$@"
}
