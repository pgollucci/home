aws_clouddirectory_facet_attributes_list() {
    local schema-arn="$1"
    local name="$2"
    shift 2

    log_and_run aws clouddirectory  --schema-arn $schema_arn --name $name "@"

}
