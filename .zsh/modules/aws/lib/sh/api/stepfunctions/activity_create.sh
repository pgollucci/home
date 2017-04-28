aws_stepfunctions_activity_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws stepfunctions create-activity --name $name "$@"
}
