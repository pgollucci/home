aws_ssm_target_with_maintenance_window_register() {
    local window-id="$1"
    local resource-type="$2"
    local targets="$3"
    shift 3

    log_and_run aws ssm  --window-id $window_id --resource-type $resource_type --targets $targets "@"

}
