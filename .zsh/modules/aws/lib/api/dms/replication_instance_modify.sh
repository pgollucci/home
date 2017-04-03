aws_dms_replication_instance_modify() {
    local replication_instance_arn="$1"
    shift 1

    cond_log_and_run aws dms modify-replication-instance --replication-instance-arn $replication_instance_arn "$@"
}
