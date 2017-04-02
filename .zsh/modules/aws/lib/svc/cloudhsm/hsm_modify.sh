aws_cloudhsm_hsm_modify() {
    local hsm-arn="$1"
    shift 1

    cond_log_and_run aws cloudhsm  --hsm-arn $hsm_arn "@"

}
