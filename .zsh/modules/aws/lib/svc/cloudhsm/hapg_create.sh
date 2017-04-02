aws_cloudhsm_hapg_create() {
    local label="$1"
    shift 1

    cond_log_and_run aws cloudhsm  --label $label "@"

}
