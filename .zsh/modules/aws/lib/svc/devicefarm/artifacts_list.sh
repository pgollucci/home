aws_devicefarm_artifacts_list() {
    local type="$1"
    local arn="$2"
    shift 2

    log_and_run aws devicefarm  --type $type --arn $arn "@"

}
