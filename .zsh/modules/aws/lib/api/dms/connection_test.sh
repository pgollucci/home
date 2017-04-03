aws_dms_connection_test() {
    local replication_instance_arn="$1"
    local endpoint_arn="$2"
    shift 2

    cond_log_and_run aws dms test-connection --replication-instance-arn $replication_instance_arn --endpoint-arn $endpoint_arn "$@"
}
