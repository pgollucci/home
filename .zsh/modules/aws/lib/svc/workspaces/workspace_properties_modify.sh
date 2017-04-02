aws_workspaces_workspace_properties_modify() {
    local workspace-id="$1"
    local workspace-properties="$2"
    shift 2

    cond_log_and_run aws workspaces  --workspace-id $workspace_id --workspace-properties $workspace_properties "@"

}
