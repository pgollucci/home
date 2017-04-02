aws_devicefarm_unique_problems_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm  --arn $arn "@"

}
