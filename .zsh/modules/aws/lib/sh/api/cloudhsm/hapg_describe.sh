aws_cloudhsm_hapg_describe() {
    local hapg_arn="$1"
    shift 1

    log_and_run aws cloudhsm describe-hapg --hapg-arn $hapg_arn "$@"
}
