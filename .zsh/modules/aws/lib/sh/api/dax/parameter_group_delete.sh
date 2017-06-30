aws_dax_parameter_group_delete() {
    local parameter_group_name="$1"
    shift 1

    cond_log_and_run aws dax delete-parameter-group --parameter-group-name $parameter_group_name "$@"
}
