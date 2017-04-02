aws_cloudhsm_hapg_delete() {
    local hapg-arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm  --hapg-arn $hapg_arn "@"

}
