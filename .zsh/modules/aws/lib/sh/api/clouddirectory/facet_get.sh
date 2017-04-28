aws_clouddirectory_facet_get() {
    local schema_arn="$1"
    local name="$2"
    shift 2

    log_and_run aws clouddirectory get-facet --schema-arn $schema_arn --name $name "$@"
}
