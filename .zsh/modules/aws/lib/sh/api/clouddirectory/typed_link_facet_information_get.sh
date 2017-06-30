aws_clouddirectory_typed_link_facet_information_get() {
    local schema_arn="$1"
    local name="$2"
    shift 2

    log_and_run aws clouddirectory get-typed-link-facet-information --schema-arn $schema_arn --name $name "$@"
}
