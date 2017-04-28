aws_cloudhsm_hapg_modify() {
    local hapg_arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm modify-hapg --hapg-arn $hapg_arn "$@"
}
