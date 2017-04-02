aws_machinelearning_data_source_delete() {
    local data-source-id="$1"
    shift 1

    cond_log_and_run aws machinelearning  --data-source-id $data_source_id "@"

}
