aws_clouddirectory_applied_schema_arns_list() {
    local directory-arn="$1"
    shift 1

    log_and_run aws clouddirectory  --directory-arn $directory_arn "@"

}
