aws_rds_orderable_db_instance_options_describe() {
    local engine="$1"
    shift 1

    log_and_run aws rds  --engine $engine "@"

}
