aws_emr_steps_cancel() {
    shift 0

    cond_log_and_run aws emr cancel-steps "$@"
}
