aws_application_autoscaling_scalable_targets_describe() {
    local service_namespace="$1"
    shift 1

    log_and_run aws application-autoscaling describe-scalable-targets --service-namespace $service_namespace "$@"
}
