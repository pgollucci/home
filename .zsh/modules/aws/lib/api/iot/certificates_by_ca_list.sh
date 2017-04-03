aws_iot_certificates_by_ca_list() {
    local ca_certificate_id="$1"
    shift 1

    log_and_run aws iot list-certificates-by-ca --ca-certificate-id $ca_certificate_id "$@"
}
