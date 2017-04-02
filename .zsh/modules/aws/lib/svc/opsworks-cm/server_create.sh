aws_opsworks-cm_server_create() {
    local service-role-arn="$1"
    local instance-type="$2"
    local instance-profile-arn="$3"
    local server-name="$4"
    shift 4

    cond_log_and_run aws opsworks-cm  --service-role-arn $service_role_arn --instance-type $instance_type --instance-profile-arn $instance_profile_arn --server-name $server_name "@"

}
