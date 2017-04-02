aws_machinelearning_data_source_update() {
    local data-source-name="$1"
    local data-source-id="$2"
    shift 2

    cond_log_and_run aws machinelearning  --data-source-name $data_source_name --data-source-id $data_source_id "@"

}
