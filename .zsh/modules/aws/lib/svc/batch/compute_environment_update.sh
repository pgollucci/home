aws_batch_compute_environment_update() {
    local compute-environment="$1"
    shift 1

    cond_log_and_run aws batch  --compute-environment $compute_environment "@"

}
