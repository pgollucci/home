aws_devicefarm_run_schedule() {
    local device-pool-arn="$1"
    local project-arn="$2"
    local test="$3"
    shift 3

    cond_log_and_run aws devicefarm  --device-pool-arn $device_pool_arn --project-arn $project_arn --test $test "@"

}
