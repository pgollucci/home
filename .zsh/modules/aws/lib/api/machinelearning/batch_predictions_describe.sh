aws_machinelearning_batch_predictions_describe() {
    shift 0

    log_and_run aws machinelearning describe-batch-predictions "$@"
}
