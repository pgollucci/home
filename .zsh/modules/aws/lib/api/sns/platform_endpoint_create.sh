aws_sns_platform_endpoint_create() {
    local platform_application_arn="$1"
    local token="$2"
    shift 2

    cond_log_and_run aws sns create-platform-endpoint --platform-application-arn $platform_application_arn --token $token "$@"
}
