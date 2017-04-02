aws_rds_option_group_create() {
    local engine-name="$1"
    local option-group-description="$2"
    local major-engine-version="$3"
    local option-group-name="$4"
    shift 4

    cond_log_and_run aws rds  --engine-name $engine_name --option-group-description $option_group_description --major-engine-version $major_engine_version --option-group-name $option_group_name "@"

}
