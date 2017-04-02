aws_sns_platform_application_attributes_get() {
    local platform-application-arn="$1"
    shift 1

    log_and_run aws sns  --platform-application-arn $platform_application_arn "@"

}
