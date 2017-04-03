aws_clouddirectory_object_create() {
    local directory_arn="$1"
    local schema_facets="$2"
    shift 2

    cond_log_and_run aws clouddirectory create-object --directory-arn $directory_arn --schema-facets $schema_facets "$@"
}
