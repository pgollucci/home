aws_workspaces_workspaces_rebuild() {
    local rebuild-workspace-requests="$1"
    shift 1

    cond_log_and_run aws workspaces  --rebuild-workspace-requests $rebuild_workspace_requests "@"

}
