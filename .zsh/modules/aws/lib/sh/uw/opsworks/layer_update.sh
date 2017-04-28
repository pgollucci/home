aws_opsworks_auto_healing() {
        local layer_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id --enable-auto-healing "$@"
}

aws_opsworks_assign_elastic_ips() {
        local layer_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id --auto-assign-elastic-ips "$@"
}

aws_opsworks_assign_public_ips() {
        local layer_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id --auto-assign-public-ips "$@"
}

aws_opsworks_updates_on_boot() {
        local layer_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id --install-updates-on-boot "$@"
}

aws_opsworks_ebs_optimized_instances() {
        local layer_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id --use-ebs-optimized-instances "$@"
}

