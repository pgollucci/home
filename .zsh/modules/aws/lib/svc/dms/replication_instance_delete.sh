aws_dms_replication_instance_delete() {
    local replication-instance-arn="$1"
    shift 1

    cond_log_and_run aws dms  --replication-instance-arn $replication_instance_arn "@"

}
