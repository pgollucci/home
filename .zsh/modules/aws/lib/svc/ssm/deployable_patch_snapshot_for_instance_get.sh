aws_ssm_deployable_patch_snapshot_for_instance_get() {
    local snapshot-id="$1"
    local instance-id="$2"
    shift 2

    log_and_run aws ssm  --snapshot-id $snapshot_id --instance-id $instance_id "@"

}
