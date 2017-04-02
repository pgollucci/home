aws_dms_certificate_import() {
    local certificate-identifier="$1"
    shift 1

    cond_log_and_run aws dms  --certificate-identifier $certificate_identifier "@"

}
