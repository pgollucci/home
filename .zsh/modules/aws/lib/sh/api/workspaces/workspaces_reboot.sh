aws_workspaces_workspaces_reboot() {
    local reboot_workspace_requests="$1"
    shift 1

    cond_log_and_run aws workspaces reboot-workspaces --reboot-workspace-requests $reboot_workspace_requests "$@"
}
