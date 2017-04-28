aws_iot_certificate_from_csr_create() {
    local certificate_signing_request="$1"
    shift 1

    cond_log_and_run aws iot create-certificate-from-csr --certificate-signing-request $certificate_signing_request "$@"
}
