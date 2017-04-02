aws_clouddirectory_facet_create() {
    local object-type="$1"
    local schema-arn="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --object-type $object_type --schema-arn $schema_arn --name $name "@"

}
