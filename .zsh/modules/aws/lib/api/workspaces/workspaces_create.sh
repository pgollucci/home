aws_workspaces_workspaces_create() {
    local workspaces="$1"
    shift 1

    cond_log_and_run aws workspaces create-workspaces --workspaces $workspaces "$@"
}
