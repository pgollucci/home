aws_iot_certificate_register() {
    local certificate-pem="$1"
    shift 1

    cond_log_and_run aws iot  --certificate-pem $certificate_pem "@"

}
