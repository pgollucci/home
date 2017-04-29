aws_codestar_project_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws codestar update-project --id $id "$@"
}
