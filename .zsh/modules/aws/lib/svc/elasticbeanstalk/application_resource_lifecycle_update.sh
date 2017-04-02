aws_elasticbeanstalk_application_resource_lifecycle_update() {
    local application-name="$1"
    local resource-lifecycle-config="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name --resource-lifecycle-config $resource_lifecycle_config "@"

}
