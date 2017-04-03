aws_clouddirectory_schema_as_json_get() {
    local schema_arn="$1"
    shift 1

    log_and_run aws clouddirectory get-schema-as-json --schema-arn $schema_arn "$@"
}
