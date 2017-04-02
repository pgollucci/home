aws_iot_certificate_transfer_reject() {
    local certificate-id="$1"
    shift 1

    cond_log_and_run aws iot  --certificate-id $certificate_id "@"

}
