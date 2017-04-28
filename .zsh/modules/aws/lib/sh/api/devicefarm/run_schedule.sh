aws_devicefarm_run_schedule() {
    local project_arn="$1"
    local device_pool_arn="$2"
    local test="$3"
    shift 3

    cond_log_and_run aws devicefarm schedule-run --project-arn $project_arn --device-pool-arn $device_pool_arn --test $test "$@"
}
