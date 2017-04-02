aws_iot_ca_certificate_describe() {
    local certificate-id="$1"
    shift 1

    log_and_run aws iot  --certificate-id $certificate_id "@"

}
