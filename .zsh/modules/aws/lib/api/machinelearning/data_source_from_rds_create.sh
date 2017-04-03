aws_machinelearning_data_source_from_rds_create() {
    local data_source_id="$1"
    local rds_data="$2"
    local role_arn="$3"
    shift 3

    cond_log_and_run aws machinelearning create-data-source-from-rds --data-source-id $data_source_id --rds-data $rds_data --role-arn $role_arn "$@"
}
