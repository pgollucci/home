aws_dms_connection_test() {
    local replication-instance-arn="$1"
    local endpoint-arn="$2"
    shift 2

    cond_log_and_run aws dms  --replication-instance-arn $replication_instance_arn --endpoint-arn $endpoint_arn "@"

}
