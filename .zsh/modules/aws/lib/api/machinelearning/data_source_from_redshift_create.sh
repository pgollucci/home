aws_machinelearning_data_source_from_redshift_create() {
    local data_source_id="$1"
    local data_spec="$2"
    local role_arn="$3"
    shift 3

    cond_log_and_run aws machinelearning create-data-source-from-redshift --data-source-id $data_source_id --data-spec $data_spec --role-arn $role_arn "$@"
}
