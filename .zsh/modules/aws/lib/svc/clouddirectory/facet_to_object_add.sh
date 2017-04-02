aws_clouddirectory_facet_to_object_add() {
    local object-reference="$1"
    local schema-facet="$2"
    local directory-arn="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --object-reference $object_reference --schema-facet $schema_facet --directory-arn $directory_arn "@"

}
