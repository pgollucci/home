aws_dms_schemas_refresh() {
    local endpoint_arn="$1"
    local replication_instance_arn="$2"
    shift 2

    cond_log_and_run aws dms refresh-schemas --endpoint-arn $endpoint_arn --replication-instance-arn $replication_instance_arn "$@"
}
