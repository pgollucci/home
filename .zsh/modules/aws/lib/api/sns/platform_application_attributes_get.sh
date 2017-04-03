aws_sns_platform_application_attributes_get() {
    local platform_application_arn="$1"
    shift 1

    log_and_run aws sns get-platform-application-attributes --platform-application-arn $platform_application_arn "$@"
}
