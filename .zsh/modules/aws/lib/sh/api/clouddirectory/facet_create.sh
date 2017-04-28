aws_clouddirectory_facet_create() {
    local schema_arn="$1"
    local name="$2"
    local object_type="$3"
    shift 3

    cond_log_and_run aws clouddirectory create-facet --schema-arn $schema_arn --name $name --object-type $object_type "$@"
}
