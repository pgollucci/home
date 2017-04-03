aws_clouddirectory_facet_names_list() {
    local schema_arn="$1"
    shift 1

    log_and_run aws clouddirectory list-facet-names --schema-arn $schema_arn "$@"
}
