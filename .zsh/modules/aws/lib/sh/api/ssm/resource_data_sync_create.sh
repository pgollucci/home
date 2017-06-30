aws_ssm_resource_data_sync_create() {
    local sync_name="$1"
    local s3_destination="$2"
    shift 2

    cond_log_and_run aws ssm create-resource-data-sync --sync-name $sync_name --s3-destination $s3_destination "$@"
}
