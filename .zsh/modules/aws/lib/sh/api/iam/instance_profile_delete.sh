aws_iam_instance_profile_delete() {
    local instance_profile_name="$1"
    shift 1

    cond_log_and_run aws iam delete-instance-profile --instance-profile-name $instance_profile_name "$@"
}
