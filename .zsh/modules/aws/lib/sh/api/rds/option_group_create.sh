aws_rds_option_group_create() {
    local option_group_name="$1"
    local engine_name="$2"
    local major_engine_version="$3"
    local option_group_description="$4"
    shift 4

    cond_log_and_run aws rds create-option-group --option-group-name $option_group_name --engine-name $engine_name --major-engine-version $major_engine_version --option-group-description $option_group_description "$@"
}
