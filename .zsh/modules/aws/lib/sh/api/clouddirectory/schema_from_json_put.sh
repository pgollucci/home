aws_clouddirectory_schema_from_json_put() {
    local schema_arn="$1"
    local document="$2"
    shift 2

    cond_log_and_run aws clouddirectory put-schema-from-json --schema-arn $schema_arn --document $document "$@"
}
