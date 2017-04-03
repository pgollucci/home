aws_dms_replication_task_create() {
    local replication_task_identifier="$1"
    local source_endpoint_arn="$2"
    local target_endpoint_arn="$3"
    local replication_instance_arn="$4"
    local migration_type="$5"
    local table_mappings="$6"
    shift 6

    cond_log_and_run aws dms create-replication-task --replication-task-identifier $replication_task_identifier --source-endpoint-arn $source_endpoint_arn --target-endpoint-arn $target_endpoint_arn --replication-instance-arn $replication_instance_arn --migration-type $migration_type --table-mappings $table_mappings "$@"
}
