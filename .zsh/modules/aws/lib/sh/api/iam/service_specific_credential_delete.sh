aws_iam_service_specific_credential_delete() {
    local service_specific_credential_id="$1"
    shift 1

    cond_log_and_run aws iam delete-service-specific-credential --service-specific-credential-id $service_specific_credential_id "$@"
}
