aws_opsworks_cm_server_create() {
    local server_name="$1"
    local instance_profile_arn="$2"
    local instance_type="$3"
    local service_role_arn="$4"
    shift 4

    cond_log_and_run aws opsworks-cm create-server --server-name $server_name --instance-profile-arn $instance_profile_arn --instance-type $instance_type --service-role-arn $service_role_arn "$@"
}
