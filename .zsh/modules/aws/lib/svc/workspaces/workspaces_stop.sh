aws_workspaces_workspaces_stop() {
    local stop-workspace-requests="$1"
    shift 1

    cond_log_and_run aws workspaces  --stop-workspace-requests $stop_workspace_requests "@"

}
