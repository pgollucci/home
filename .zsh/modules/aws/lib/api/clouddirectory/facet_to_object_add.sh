aws_clouddirectory_facet_to_object_add() {
    local directory_arn="$1"
    local schema_facet="$2"
    local object_reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory add-facet-to-object --directory-arn $directory_arn --schema-facet $schema_facet --object-reference $object_reference "$@"
}
