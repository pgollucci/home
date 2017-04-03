aws_ssm_deployable_patch_snapshot_for_instance_get() {
    local instance_id="$1"
    local snapshot_id="$2"
    shift 2

    log_and_run aws ssm get-deployable-patch-snapshot-for-instance --instance-id $instance_id --snapshot-id $snapshot_id "$@"
}
