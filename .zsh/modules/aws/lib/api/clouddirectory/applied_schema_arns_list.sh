aws_clouddirectory_applied_schema_arns_list() {
    local directory_arn="$1"
    shift 1

    log_and_run aws clouddirectory list-applied-schema-arns --directory-arn $directory_arn "$@"
}
