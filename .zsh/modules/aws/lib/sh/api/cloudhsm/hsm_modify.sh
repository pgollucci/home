aws_cloudhsm_hsm_modify() {
    local hsm_arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm modify-hsm --hsm-arn $hsm_arn "$@"
}
