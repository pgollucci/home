aws_cloudhsm_hapg_delete() {
    local hapg_arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm delete-hapg --hapg-arn $hapg_arn "$@"
}
