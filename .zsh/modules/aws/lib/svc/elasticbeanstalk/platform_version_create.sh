aws_elasticbeanstalk_platform_version_create() {
    local platform-version="$1"
    local platform-definition-bundle="$2"
    local platform-name="$3"
    shift 3

    cond_log_and_run aws elasticbeanstalk  --platform-version $platform_version --platform-definition-bundle $platform_definition_bundle --platform-name $platform_name "@"

}
