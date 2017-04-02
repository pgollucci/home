aws_iam_service_specific_credential_reset() {
    local service-specific-credential-id="$1"
    shift 1

    cond_log_and_run aws iam  --service-specific-credential-id $service_specific_credential_id "@"

}
