aws_dms_replication_instance_create() {
    local replication_instance_identifier="$1"
    local replication_instance_class="$2"
    shift 2

    cond_log_and_run aws dms create-replication-instance --replication-instance-identifier $replication_instance_identifier --replication-instance-class $replication_instance_class "$@"
}
