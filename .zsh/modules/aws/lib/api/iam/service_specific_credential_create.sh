aws_iam_service_specific_credential_create() {
    local user_name="$1"
    local service_name="$2"
    shift 2

    cond_log_and_run aws iam create-service-specific-credential --user-name $user_name --service-name $service_name "$@"
}
