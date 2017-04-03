aws_iam_instance_profile_get() {
    local instance_profile_name="$1"
    shift 1

    log_and_run aws iam get-instance-profile --instance-profile-name $instance_profile_name "$@"
}
