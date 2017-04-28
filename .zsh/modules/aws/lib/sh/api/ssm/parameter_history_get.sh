aws_ssm_parameter_history_get() {
    local name="$1"
    shift 1

    log_and_run aws ssm get-parameter-history --name $name "$@"
}
