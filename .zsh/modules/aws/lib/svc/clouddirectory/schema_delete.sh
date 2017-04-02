aws_clouddirectory_schema_delete() {
    local schema-arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory  --schema-arn $schema_arn "@"

}
