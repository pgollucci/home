aws_dms_replication_task_create() {
    local replication-instance-arn="$1"
    local target-endpoint-arn="$2"
    local table-mappings="$3"
    local replication-task-identifier="$4"
    local migration-type="$5"
    local source-endpoint-arn="$6"
    shift 6

    cond_log_and_run aws dms  --replication-instance-arn $replication_instance_arn --target-endpoint-arn $target_endpoint_arn --table-mappings $table_mappings --replication-task-identifier $replication_task_identifier --migration-type $migration_type --source-endpoint-arn $source_endpoint_arn "@"

}
