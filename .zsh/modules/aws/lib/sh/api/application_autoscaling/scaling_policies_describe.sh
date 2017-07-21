aws_application_autoscaling_scaling_policies_describe() {
    local service_namespace="$1"
    shift 1

    log_and_run aws application-autoscaling describe-scaling-policies --service-namespace $service_namespace "$@"
}
