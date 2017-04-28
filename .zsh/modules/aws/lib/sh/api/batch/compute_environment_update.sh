aws_batch_compute_environment_update() {
    local compute_environment="$1"
    shift 1

    cond_log_and_run aws batch update-compute-environment --compute-environment $compute_environment "$@"
}
