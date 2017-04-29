aws_codestar_project_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws codestar delete-project --id $id "$@"
}
