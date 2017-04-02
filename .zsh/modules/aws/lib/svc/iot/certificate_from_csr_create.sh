aws_iot_certificate_from_csr_create() {
    local certificate-signing-request="$1"
    shift 1

    cond_log_and_run aws iot  --certificate-signing-request $certificate_signing_request "@"

}
