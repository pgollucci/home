aws_iot_certificate_delete() {
    local certificate_id="$1"
    shift 1

    cond_log_and_run aws iot delete-certificate --certificate-id $certificate_id "$@"
}
