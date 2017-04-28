aws_appstream_stack_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws appstream create-stack --name $name "$@"
}
