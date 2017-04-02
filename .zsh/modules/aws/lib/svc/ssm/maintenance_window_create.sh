aws_ssm_maintenance_window_create() {
    local duration="$1"
    local allow-unassociated-targets="$2"
    local name="$3"
    local cutoff="$4"
    local schedule="$5"
    shift 5

    cond_log_and_run aws ssm  --duration $duration --allow-unassociated-targets $allow_unassociated_targets --name $name --cutoff $cutoff --schedule $schedule "@"

}
