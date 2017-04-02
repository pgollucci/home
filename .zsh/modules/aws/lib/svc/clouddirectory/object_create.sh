aws_clouddirectory_object_create() {
    local schema-facets="$1"
    local directory-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --schema-facets $schema_facets --directory-arn $directory_arn "@"

}
