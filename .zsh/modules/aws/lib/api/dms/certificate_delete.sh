aws_dms_certificate_delete() {
    local certificate_arn="$1"
    shift 1

    cond_log_and_run aws dms delete-certificate --certificate-arn $certificate_arn "$@"
}
