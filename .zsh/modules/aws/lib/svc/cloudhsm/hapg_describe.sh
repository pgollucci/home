aws_cloudhsm_hapg_describe() {
    local hapg-arn="$1"
    shift 1

    log_and_run aws cloudhsm  --hapg-arn $hapg_arn "@"

}
