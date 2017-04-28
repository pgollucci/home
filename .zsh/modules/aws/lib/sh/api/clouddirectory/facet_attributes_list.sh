aws_clouddirectory_facet_attributes_list() {
    local schema_arn="$1"
    local name="$2"
    shift 2

    log_and_run aws clouddirectory list-facet-attributes --schema-arn $schema_arn --name $name "$@"
}
