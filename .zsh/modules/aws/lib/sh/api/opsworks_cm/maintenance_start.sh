aws_opsworks_cm_maintenance_start() {
    local server_name="$1"
    shift 1

    cond_log_and_run aws opsworks-cm start-maintenance --server-name $server_name "$@"
}
