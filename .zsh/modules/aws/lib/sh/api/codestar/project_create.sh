aws_codestar_project_create() {
    local name="$1"
    local id="$2"
    shift 2

    cond_log_and_run aws codestar create-project --name $name --id $id "$@"
}
