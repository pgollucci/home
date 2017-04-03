aws_iot_certificate_describe() {
    local certificate_id="$1"
    shift 1

    log_and_run aws iot describe-certificate --certificate-id $certificate_id "$@"
}
