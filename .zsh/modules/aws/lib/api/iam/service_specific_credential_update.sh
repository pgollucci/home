aws_iam_service_specific_credential_update() {
    local service_specific_credential_id="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws iam update-service-specific-credential --service-specific-credential-id $service_specific_credential_id --status $status "$@"
}
