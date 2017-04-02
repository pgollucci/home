aws_clouddirectory_schema_publish() {
    local development-schema-arn="$1"
    local schema-version="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --development-schema-arn $development_schema_arn --schema-version $schema_version "@"

}
