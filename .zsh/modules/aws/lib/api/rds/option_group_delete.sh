aws_rds_option_group_delete() {
    local option_group_name="$1"
    shift 1

    cond_log_and_run aws rds delete-option-group --option-group-name $option_group_name "$@"
}
