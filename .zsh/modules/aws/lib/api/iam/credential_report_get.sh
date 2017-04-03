aws_iam_credential_report_get() {
    shift 0

    log_and_run aws iam get-credential-report "$@"
}
