aws_clouddirectory_schema_as_json_get() {
    local schema-arn="$1"
    shift 1

    log_and_run aws clouddirectory  --schema-arn $schema_arn "@"

}
