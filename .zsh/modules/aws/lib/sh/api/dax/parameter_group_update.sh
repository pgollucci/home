aws_dax_parameter_group_update() {
    local parameter_group_name="$1"
    local parameter_name_values="$2"
    shift 2

    cond_log_and_run aws dax update-parameter-group --parameter-group-name $parameter_group_name --parameter-name-values $parameter_name_values "$@"
}
