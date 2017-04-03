aws_machinelearning_data_source_update() {
    local data_source_id="$1"
    local data_source_name="$2"
    shift 2

    cond_log_and_run aws machinelearning update-data-source --data-source-id $data_source_id --data-source-name $data_source_name "$@"
}
