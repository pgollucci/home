aws_devicefarm_project_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws devicefarm create-project --name $name "$@"
}
