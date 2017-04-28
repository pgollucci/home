aws_ssm_parameters_get() {
    local names="$1"
    shift 1

    log_and_run aws ssm get-parameters --names $names "$@"
}
