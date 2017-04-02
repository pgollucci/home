aws_clouddirectory_schema_update() {
    local schema-arn="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --schema-arn $schema_arn --name $name "@"

}
