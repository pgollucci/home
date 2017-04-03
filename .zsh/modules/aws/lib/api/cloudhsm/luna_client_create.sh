aws_cloudhsm_luna_client_create() {
    local certificate="$1"
    shift 1

    cond_log_and_run aws cloudhsm create-luna-client --certificate $certificate "$@"
}
