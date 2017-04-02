aws_machinelearning_data_source_get() {
    local data-source-id="$1"
    shift 1

    log_and_run aws machinelearning  --data-source-id $data_source_id "@"

}
