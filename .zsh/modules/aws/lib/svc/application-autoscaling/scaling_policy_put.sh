aws_application-autoscaling_scaling_policy_put() {
    local policy-name="$1"
    local scalable-dimension="$2"
    local resource-id="$3"
    local service-namespace="$4"
    shift 4

    cond_log_and_run aws application-autoscaling  --policy-name $policy_name --scalable-dimension $scalable_dimension --resource-id $resource_id --service-namespace $service_namespace "@"

}
