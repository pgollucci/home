aws_machinelearning_data_source_from_redshift_create() {
    local data-source-id="$1"
    local role-arn="$2"
    local data-spec="$3"
    shift 3

    cond_log_and_run aws machinelearning  --data-source-id $data_source_id --role-arn $role_arn --data-spec $data_spec "@"

}
