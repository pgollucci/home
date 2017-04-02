aws_dynamodb_table_create() {
    local table-name="$1"
    local provisioned-throughput="$2"
    local key-schema="$3"
    local attribute-definitions="$4"
    shift 4

    cond_log_and_run aws dynamodb  --table-name $table_name --provisioned-throughput $provisioned_throughput --key-schema $key_schema --attribute-definitions $attribute_definitions "@"

}
