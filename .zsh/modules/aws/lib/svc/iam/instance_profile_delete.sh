aws_iam_instance_profile_delete() {
    local instance-profile-name="$1"
    shift 1

    cond_log_and_run aws iam  --instance-profile-name $instance_profile_name "@"

}
