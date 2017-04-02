aws_sns_endpoints_by_platform_application_list() {
    local platform-application-arn="$1"
    shift 1

    log_and_run aws sns  --platform-application-arn $platform_application_arn "@"

}
