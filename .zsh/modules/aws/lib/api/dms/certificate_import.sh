aws_dms_certificate_import() {
    local certificate_identifier="$1"
    shift 1

    cond_log_and_run aws dms import-certificate --certificate-identifier $certificate_identifier "$@"
}
