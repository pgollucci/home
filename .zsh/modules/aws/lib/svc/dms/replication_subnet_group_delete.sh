aws_dms_replication_subnet_group_delete() {
    local replication-subnet-group-identifier="$1"
    shift 1

    cond_log_and_run aws dms  --replication-subnet-group-identifier $replication_subnet_group_identifier "@"

}
