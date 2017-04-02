aws_dms_replication_instance_create() {
    local replication-instance-class="$1"
    local replication-instance-identifier="$2"
    shift 2

    cond_log_and_run aws dms  --replication-instance-class $replication_instance_class --replication-instance-identifier $replication_instance_identifier "@"

}
