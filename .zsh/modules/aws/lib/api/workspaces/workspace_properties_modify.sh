aws_workspaces_workspace_properties_modify() {
    local workspace_id="$1"
    local workspace_properties="$2"
    shift 2

    cond_log_and_run aws workspaces modify-workspace-properties --workspace-id $workspace_id --workspace-properties $workspace_properties "$@"
}
