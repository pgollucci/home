aws_dms_replication_subnet_group_delete() {
    local replication_subnet_group_identifier="$1"
    shift 1

    cond_log_and_run aws dms delete-replication-subnet-group --replication-subnet-group-identifier $replication_subnet_group_identifier "$@"
}
