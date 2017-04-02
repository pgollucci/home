aws_iam_service_specific_credential_create() {
    local service-name="$1"
    local user-name="$2"
    shift 2

    cond_log_and_run aws iam  --service-name $service_name --user-name $user_name "@"

}
