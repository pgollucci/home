aws_clouddirectory_schema_apply() {
    local published_schema_arn="$1"
    local directory_arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory apply-schema --published-schema-arn $published_schema_arn --directory-arn $directory_arn "$@"
}
