aws_cloudhsm_luna_client_delete() {
    local client_arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm delete-luna-client --client-arn $client_arn "$@"
}
