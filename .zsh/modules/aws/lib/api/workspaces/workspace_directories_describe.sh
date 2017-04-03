aws_workspaces_workspace_directories_describe() {
    shift 0

    log_and_run aws workspaces describe-workspace-directories "$@"
}
