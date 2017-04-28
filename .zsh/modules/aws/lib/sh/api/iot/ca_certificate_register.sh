aws_iot_ca_certificate_register() {
    local ca_certificate="$1"
    local verification_certificate="$2"
    shift 2

    cond_log_and_run aws iot register-ca-certificate --ca-certificate $ca_certificate --verification-certificate $verification_certificate "$@"
}
