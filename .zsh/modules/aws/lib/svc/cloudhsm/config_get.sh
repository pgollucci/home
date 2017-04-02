aws_cloudhsm_config_get() {
    local hapg-list="$1"
    local client-version="$2"
    local client-arn="$3"
    shift 3

    log_and_run aws cloudhsm  --hapg-list $hapg_list --client-version $client_version --client-arn $client_arn "@"

}
