aws_application_autoscaling_scaling_activities_describe() {
    local service_namespace="$1"
    shift 1

    log_and_run aws application-autoscaling describe-scaling-activities --service-namespace $service_namespace "$@"
}
