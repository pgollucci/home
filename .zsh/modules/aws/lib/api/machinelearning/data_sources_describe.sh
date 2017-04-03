aws_machinelearning_data_sources_describe() {
    shift 0

    log_and_run aws machinelearning describe-data-sources "$@"
}
