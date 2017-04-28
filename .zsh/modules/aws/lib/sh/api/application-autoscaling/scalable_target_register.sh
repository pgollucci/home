aws_application-autoscaling_scalable_target_register() {
    local service_namespace="$1"
    local resource_id="$2"
    local scalable_dimension="$3"
    shift 3

    log_and_run aws application-autoscaling register-scalable-target --service-namespace $service_namespace --resource-id $resource_id --scalable-dimension $scalable_dimension "$@"
}
