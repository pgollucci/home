aws_kinesisanalytics_input_schema_discover() {
    local resource-arn="$1"
    local role-arn="$2"
    local input-starting-position-configuration="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --resource-arn $resource_arn --role-arn $role_arn --input-starting-position-configuration $input_starting_position_configuration "@"

}
