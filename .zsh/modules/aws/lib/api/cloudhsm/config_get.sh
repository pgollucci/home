aws_cloudhsm_config_get() {
    local client_arn="$1"
    local client_version="$2"
    local hapg_list="$3"
    shift 3

    log_and_run aws cloudhsm get-config --client-arn $client_arn --client-version $client_version --hapg-list $hapg_list "$@"
}
