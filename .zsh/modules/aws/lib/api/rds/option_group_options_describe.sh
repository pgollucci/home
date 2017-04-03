aws_rds_option_group_options_describe() {
    local engine_name="$1"
    shift 1

    log_and_run aws rds describe-option-group-options --engine-name $engine_name "$@"
}
