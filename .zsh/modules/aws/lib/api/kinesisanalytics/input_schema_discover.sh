aws_kinesisanalytics_input_schema_discover() {
    local resource_arn="$1"
    local role_arn="$2"
    local input_starting_position_configuration="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics discover-input-schema --resource-arn $resource_arn --role-arn $role_arn --input-starting-position-configuration $input_starting_position_configuration "$@"
}
