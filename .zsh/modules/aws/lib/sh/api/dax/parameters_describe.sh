aws_dax_parameters_describe() {
    local parameter_group_name="$1"
    shift 1

    log_and_run aws dax describe-parameters --parameter-group-name $parameter_group_name "$@"
}
