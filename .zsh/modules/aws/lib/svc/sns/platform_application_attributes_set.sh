aws_sns_platform_application_attributes_set() {
    local platform-application-arn="$1"
    local attributes="$2"
    shift 2

    cond_log_and_run aws sns  --platform-application-arn $platform_application_arn --attributes $attributes "@"

}
