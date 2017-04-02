aws_appstream_stack_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws appstream  --name $name "@"

}
