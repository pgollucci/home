aws_iam_credential_report_generate() {

    cond_log_and_run aws iam generate-credential-report "$@"
}
