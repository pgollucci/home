aws_emr_steps_cancel() {

    cond_log_and_run aws emr cancel-steps "$@"
}
