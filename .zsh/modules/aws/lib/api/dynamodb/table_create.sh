aws_dynamodb_table_create() {
    local attribute_definitions="$1"
    local table_name="$2"
    local key_schema="$3"
    local provisioned_throughput="$4"
    shift 4

    cond_log_and_run aws dynamodb create-table --attribute-definitions $attribute_definitions --table-name $table_name --key-schema $key_schema --provisioned-throughput $provisioned_throughput "$@"
}
