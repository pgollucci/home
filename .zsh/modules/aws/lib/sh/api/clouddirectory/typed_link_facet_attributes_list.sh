aws_clouddirectory_typed_link_facet_attributes_list() {
    local schema_arn="$1"
    local name="$2"
    shift 2

    log_and_run aws clouddirectory list-typed-link-facet-attributes --schema-arn $schema_arn --name $name "$@"
}
