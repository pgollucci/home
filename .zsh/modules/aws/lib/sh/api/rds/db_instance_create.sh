aws_rds_db_instance_create() {
    local db_instance_identifier="$1"
    local db_instance_class="$2"
    local engine="$3"
    shift 3

    cond_log_and_run aws rds create-db-instance --db-instance-identifier $db_instance_identifier --db-instance-class $db_instance_class --engine $engine "$@"
}
