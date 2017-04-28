aws_sns_endpoints_by_platform_application_list() {
    local platform_application_arn="$1"
    shift 1

    log_and_run aws sns list-endpoints-by-platform-application --platform-application-arn $platform_application_arn "$@"
}
