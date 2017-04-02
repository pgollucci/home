aws_iam_instance_profile_get() {
    local instance-profile-name="$1"
    shift 1

    log_and_run aws iam  --instance-profile-name $instance_profile_name "@"

}
