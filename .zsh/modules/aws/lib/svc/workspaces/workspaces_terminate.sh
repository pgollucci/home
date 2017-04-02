aws_workspaces_workspaces_terminate() {
    local terminate-workspace-requests="$1"
    shift 1

    cond_log_and_run aws workspaces  --terminate-workspace-requests $terminate_workspace_requests "@"

}
