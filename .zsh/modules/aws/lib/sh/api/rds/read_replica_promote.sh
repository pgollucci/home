aws_rds_read_replica_promote() {
    local db_instance_identifier="$1"
    shift 1

    cond_log_and_run aws rds promote-read-replica --db-instance-identifier $db_instance_identifier "$@"
}
