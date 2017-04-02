aws_cloudhsm_luna_client_delete() {
    local client-arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm  --client-arn $client_arn "@"

}
