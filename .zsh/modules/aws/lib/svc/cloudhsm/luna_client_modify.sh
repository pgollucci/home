aws_cloudhsm_luna_client_modify() {
    local certificate="$1"
    local client-arn="$2"
    shift 2

    cond_log_and_run aws cloudhsm  --certificate $certificate --client-arn $client_arn "@"

}
