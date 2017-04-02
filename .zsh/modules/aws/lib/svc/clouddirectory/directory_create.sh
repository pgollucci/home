aws_clouddirectory_directory_create() {
    local name="$1"
    local schema-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --name $name --schema-arn $schema_arn "@"

}
