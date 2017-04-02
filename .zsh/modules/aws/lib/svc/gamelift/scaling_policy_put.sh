aws_gamelift_scaling_policy_put() {
    local comparison-operator="$1"
    local scaling-adjustment="$2"
    local metric-name="$3"
    local name="$4"
    local evaluation-periods="$5"
    local scaling-adjustment-type="$6"
    local fleet-id="$7"
    local threshold="$8"
    shift 8

    cond_log_and_run aws gamelift  --comparison-operator $comparison_operator --scaling-adjustment $scaling_adjustment --metric-name $metric_name --name $name --evaluation-periods $evaluation_periods --scaling-adjustment-type $scaling_adjustment_type --fleet-id $fleet_id --threshold $threshold "@"

}
