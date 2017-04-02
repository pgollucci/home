aws_sns_platform_endpoint_create() {
    local token="$1"
    local platform-application-arn="$2"
    shift 2

    cond_log_and_run aws sns  --token $token --platform-application-arn $platform_application_arn "@"

}
