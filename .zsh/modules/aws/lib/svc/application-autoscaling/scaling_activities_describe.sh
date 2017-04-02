aws_application-autoscaling_scaling_activities_describe() {
    local service-namespace="$1"
    shift 1

    log_and_run aws application-autoscaling  --service-namespace $service_namespace "@"

}
