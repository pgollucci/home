aws_clouddirectory_schema_apply() {
    local published-schema-arn="$1"
    local directory-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --published-schema-arn $published_schema_arn --directory-arn $directory_arn "@"

}
