aws_rds_read_replica_promote() {
    local db-instance-identifier="$1"
    shift 1

    cond_log_and_run aws rds  --db-instance-identifier $db_instance_identifier "@"

}
