aws_opsworks_stack_create() {
    local stack-region="$1"
    local name="$2"
    local service-role-arn="$3"
    local default-instance-profile-arn="$4"
    shift 4

    cond_log_and_run aws opsworks  --stack-region $stack_region --name $name --service-role-arn $service_role_arn --default-instance-profile-arn $default_instance_profile_arn "@"

}
