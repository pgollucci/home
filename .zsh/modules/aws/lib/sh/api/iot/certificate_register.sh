aws_iot_certificate_register() {
    local certificate_pem="$1"
    shift 1

    cond_log_and_run aws iot register-certificate --certificate-pem $certificate_pem "$@"
}
