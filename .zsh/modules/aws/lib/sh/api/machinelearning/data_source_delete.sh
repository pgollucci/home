aws_machinelearning_data_source_delete() {
    local data_source_id="$1"
    shift 1

    cond_log_and_run aws machinelearning delete-data-source --data-source-id $data_source_id "$@"
}
