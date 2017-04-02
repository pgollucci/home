aws_dms_replication_subnet_group_modify() {
    local subnet-ids="$1"
    local replication-subnet-group-identifier="$2"
    shift 2

    cond_log_and_run aws dms  --subnet-ids $subnet_ids --replication-subnet-group-identifier $replication_subnet_group_identifier "@"

}
