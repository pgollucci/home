aws_ssm_parameter_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws ssm delete-parameter --name $name "$@"
}
