aws_cloudhsm_hsm_delete() {
    local hsm_arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm delete-hsm --hsm-arn $hsm_arn "$@"
}
