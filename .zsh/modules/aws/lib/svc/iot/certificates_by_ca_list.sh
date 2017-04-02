aws_iot_certificates_by_ca_list() {
    local ca-certificate-id="$1"
    shift 1

    log_and_run aws iot  --ca-certificate-id $ca_certificate_id "@"

}
