aws_iot_ca_certificate_update() {
    local certificate_id="$1"
    shift 1

    cond_log_and_run aws iot update-ca-certificate --certificate-id $certificate_id "$@"
}
