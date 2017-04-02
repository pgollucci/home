aws_application-autoscaling_scalable_target_register() {
    local scalable-dimension="$1"
    local resource-id="$2"
    local service-namespace="$3"
    shift 3

    log_and_run aws application-autoscaling  --scalable-dimension $scalable_dimension --resource-id $resource_id --service-namespace $service_namespace "@"

}
