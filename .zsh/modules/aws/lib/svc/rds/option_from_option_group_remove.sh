aws_rds_option_from_option_group_remove() {
    local option-group-name="$1"
    shift 1

    cond_log_and_run aws rds  --option-group-name $option_group_name "@"

}
