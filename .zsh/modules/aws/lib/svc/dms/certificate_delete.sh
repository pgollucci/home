aws_dms_certificate_delete() {
    local certificate-arn="$1"
    shift 1

    cond_log_and_run aws dms  --certificate-arn $certificate_arn "@"

}
