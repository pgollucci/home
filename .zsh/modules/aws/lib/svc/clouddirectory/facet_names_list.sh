aws_clouddirectory_facet_names_list() {
    local schema-arn="$1"
    shift 1

    log_and_run aws clouddirectory  --schema-arn $schema_arn "@"

}
