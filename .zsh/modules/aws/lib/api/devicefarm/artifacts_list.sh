aws_devicefarm_artifacts_list() {
    local arn="$1"
    local type="$2"
    shift 2

    log_and_run aws devicefarm list-artifacts --arn $arn --type $type "$@"
}
