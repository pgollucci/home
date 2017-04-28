aws_clouddirectory_schema_delete() {
    local schema_arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory delete-schema --schema-arn $schema_arn "$@"
}
