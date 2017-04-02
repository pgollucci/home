aws_machinelearning_data_source_from_s3_create() {
    local data-spec="$1"
    local data-source-id="$2"
    shift 2

    cond_log_and_run aws machinelearning  --data-spec $data_spec --data-source-id $data_source_id "@"

}
