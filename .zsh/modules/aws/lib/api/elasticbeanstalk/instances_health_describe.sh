aws_elasticbeanstalk_instances_health_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-instances-health "$@"
}
