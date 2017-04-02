aws_devicefarm_run_delete() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm  --arn $arn "@"

}
