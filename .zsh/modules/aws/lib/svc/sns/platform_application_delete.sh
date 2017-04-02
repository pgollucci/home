aws_sns_platform_application_delete() {
    local platform-application-arn="$1"
    shift 1

    cond_log_and_run aws sns  --platform-application-arn $platform_application_arn "@"

}
