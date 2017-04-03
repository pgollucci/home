aws_opsworks_updates_on_boot() {
        local instance_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-instance --instance-id $instance_id --install-updates-on-boot "$@"
}

aws_opsworks_optimized() {
        local instance_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-instance --instance-id $instance_id --ebs-optimized "$@"
}

