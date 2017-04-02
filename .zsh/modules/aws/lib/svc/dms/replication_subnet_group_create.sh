aws_dms_replication_subnet_group_create() {
    local replication-subnet-group-identifier="$1"
    local subnet-ids="$2"
    local replication-subnet-group-description="$3"
    shift 3

    cond_log_and_run aws dms  --replication-subnet-group-identifier $replication_subnet_group_identifier --subnet-ids $subnet_ids --replication-subnet-group-description $replication_subnet_group_description "@"

}
