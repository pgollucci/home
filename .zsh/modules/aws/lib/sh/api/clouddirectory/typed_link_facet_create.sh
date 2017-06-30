aws_clouddirectory_typed_link_facet_create() {
    local schema_arn="$1"
    local facet="$2"
    shift 2

    cond_log_and_run aws clouddirectory create-typed-link-facet --schema-arn $schema_arn --facet $facet "$@"
}
