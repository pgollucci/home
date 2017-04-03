aws_rds_orderable_db_instance_options_describe() {
    local engine="$1"
    shift 1

    log_and_run aws rds describe-orderable-db-instance-options --engine $engine "$@"
}
