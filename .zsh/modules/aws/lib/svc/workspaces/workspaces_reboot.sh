aws_workspaces_workspaces_reboot() {
    local reboot-workspace-requests="$1"
    shift 1

    cond_log_and_run aws workspaces  --reboot-workspace-requests $reboot_workspace_requests "@"

}
