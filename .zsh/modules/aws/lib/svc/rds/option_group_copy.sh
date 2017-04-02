aws_rds_option_group_copy() {
    local source-option-group-identifier="$1"
    local target-option-group-identifier="$2"
    local target-option-group-description="$3"
    shift 3

    cond_log_and_run aws rds  --source-option-group-identifier $source_option_group_identifier --target-option-group-identifier $target_option_group_identifier --target-option-group-description $target_option_group_description "@"

}
