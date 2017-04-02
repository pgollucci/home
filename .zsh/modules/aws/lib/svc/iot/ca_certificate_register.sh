aws_iot_ca_certificate_register() {
    local verification-certificate="$1"
    local ca-certificate="$2"
    shift 2

    cond_log_and_run aws iot  --verification-certificate $verification_certificate --ca-certificate $ca_certificate "@"

}
