aws_gamelift_scaling_policy_put() {
    local name="$1"
    local fleet_id="$2"
    local scaling_adjustment="$3"
    local scaling_adjustment_type="$4"
    local threshold="$5"
    local comparison_operator="$6"
    local evaluation_periods="$7"
    local metric_name="$8"
    shift 8

    cond_log_and_run aws gamelift put-scaling-policy --name $name --fleet-id $fleet_id --scaling-adjustment $scaling_adjustment --scaling-adjustment-type $scaling_adjustment_type --threshold $threshold --comparison-operator $comparison_operator --evaluation-periods $evaluation_periods --metric-name $metric_name "$@"
}
