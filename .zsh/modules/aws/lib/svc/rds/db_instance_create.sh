aws_rds_db_instance_create() {
    local db-instance-class="$1"
    local engine="$2"
    local db-instance-identifier="$3"
    shift 3

    cond_log_and_run aws rds  --db-instance-class $db_instance_class --engine $engine --db-instance-identifier $db_instance_identifier "@"

}
