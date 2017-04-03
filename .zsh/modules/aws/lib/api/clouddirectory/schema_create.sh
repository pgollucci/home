aws_clouddirectory_schema_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws clouddirectory create-schema --name $name "$@"
}
