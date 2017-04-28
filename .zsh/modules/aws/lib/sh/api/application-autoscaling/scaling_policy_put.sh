aws_application-autoscaling_scaling_policy_put() {
    local policy_name="$1"
    local service_namespace="$2"
    local resource_id="$3"
    local scalable_dimension="$4"
    shift 4

    cond_log_and_run aws application-autoscaling put-scaling-policy --policy-name $policy_name --service-namespace $service_namespace --resource-id $resource_id --scalable-dimension $scalable_dimension "$@"
}
