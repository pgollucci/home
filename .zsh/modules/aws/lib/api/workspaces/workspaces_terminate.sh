aws_workspaces_workspaces_terminate() {
    local terminate_workspace_requests="$1"
    shift 1

    cond_log_and_run aws workspaces terminate-workspaces --terminate-workspace-requests $terminate_workspace_requests "$@"
}
