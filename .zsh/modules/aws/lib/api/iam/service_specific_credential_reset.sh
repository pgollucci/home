aws_iam_service_specific_credential_reset() {
    local service_specific_credential_id="$1"
    shift 1

    cond_log_and_run aws iam reset-service-specific-credential --service-specific-credential-id $service_specific_credential_id "$@"
}
