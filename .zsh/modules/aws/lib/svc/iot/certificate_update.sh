aws_iot_certificate_update() {
    local new-status="$1"
    local certificate-id="$2"
    shift 2

    cond_log_and_run aws iot  --new-status $new_status --certificate-id $certificate_id "@"

}
