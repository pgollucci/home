aws_machinelearning_data_source_from_s3_create() {
    local data_source_id="$1"
    local data_spec="$2"
    shift 2

    cond_log_and_run aws machinelearning create-data-source-from-s3 --data-source-id $data_source_id --data-spec $data_spec "$@"
}
