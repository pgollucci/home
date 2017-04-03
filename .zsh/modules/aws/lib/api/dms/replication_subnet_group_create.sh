aws_dms_replication_subnet_group_create() {
    local replication_subnet_group_identifier="$1"
    local replication_subnet_group_description="$2"
    local subnet_ids="$3"
    shift 3

    cond_log_and_run aws dms create-replication-subnet-group --replication-subnet-group-identifier $replication_subnet_group_identifier --replication-subnet-group-description $replication_subnet_group_description --subnet-ids $subnet_ids "$@"
}
