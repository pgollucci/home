aws_cloudhsm_luna_client_modify() {
    local client_arn="$1"
    local certificate="$2"
    shift 2

    cond_log_and_run aws cloudhsm modify-luna-client --client-arn $client_arn --certificate $certificate "$@"
}
