aws_ssm_resource_data_sync_delete() {
    local sync_name="$1"
    shift 1

    cond_log_and_run aws ssm delete-resource-data-sync --sync-name $sync_name "$@"
}
