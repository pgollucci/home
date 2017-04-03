aws_ssm_maintenance_window_create() {
    local name="$1"
    local schedule="$2"
    local duration="$3"
    local cutoff="$4"
    local allow_unassociated_targets="$5"
    shift 5

    cond_log_and_run aws ssm create-maintenance-window --name $name --schedule $schedule --duration $duration --cutoff $cutoff --allow-unassociated-targets $allow_unassociated_targets "$@"
}
