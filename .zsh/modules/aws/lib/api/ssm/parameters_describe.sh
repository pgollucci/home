aws_ssm_parameters_describe() {
    shift 0

    log_and_run aws ssm describe-parameters "$@"
}
