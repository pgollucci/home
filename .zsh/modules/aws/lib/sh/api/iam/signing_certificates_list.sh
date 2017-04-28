aws_iam_signing_certificates_list() {

    log_and_run aws iam list-signing-certificates "$@"
}
