aws_application_autoscaling_scaling_policy_delete() {
    local policy_name="$1"
    local service_namespace="$2"
    local resource_id="$3"
    local scalable_dimension="$4"
    shift 4

    cond_log_and_run aws application-autoscaling delete-scaling-policy --policy-name $policy_name --service-namespace $service_namespace --resource-id $resource_id --scalable-dimension $scalable_dimension "$@"
}
