aws_ssm_parameters_delete() {
    local names="$1"
    shift 1

    cond_log_and_run aws ssm delete-parameters --names $names "$@"
}
