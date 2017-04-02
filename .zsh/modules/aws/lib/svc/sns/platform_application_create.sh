aws_sns_platform_application_create() {
    local name="$1"
    local platform="$2"
    local attributes="$3"
    shift 3

    cond_log_and_run aws sns  --name $name --platform $platform --attributes $attributes "@"

}
