aws_workspaces_workspaces_start() {
    local start-workspace-requests="$1"
    shift 1

    cond_log_and_run aws workspaces  --start-workspace-requests $start_workspace_requests "@"

}
