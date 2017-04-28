aws_sns_platform_application_delete() {
    local platform_application_arn="$1"
    shift 1

    cond_log_and_run aws sns delete-platform-application --platform-application-arn $platform_application_arn "$@"
}
