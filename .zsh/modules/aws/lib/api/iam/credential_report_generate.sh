aws_iam_credential_report_generate() {
    shift 0

    cond_log_and_run aws iam generate-credential-report "$@"
}
