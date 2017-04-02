aws_application-autoscaling_scalable_targets_describe() {
    local service-namespace="$1"
    shift 1

    log_and_run aws application-autoscaling  --service-namespace $service_namespace "@"

}
