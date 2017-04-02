aws_iam_service_specific_credential_update() {
    local status="$1"
    local service-specific-credential-id="$2"
    shift 2

    cond_log_and_run aws iam  --status $status --service-specific-credential-id $service_specific_credential_id "@"

}
