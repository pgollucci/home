aws_machinelearning_data_source_from_rds_create() {
    local data-source-id="$1"
    local rds-data="$2"
    local role-arn="$3"
    shift 3

    cond_log_and_run aws machinelearning  --data-source-id $data_source_id --rds-data $rds_data --role-arn $role_arn "@"

}
