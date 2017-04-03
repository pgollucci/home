aws_iam_signing_certificates_list() {
    shift 0

    log_and_run aws iam list-signing-certificates "$@"
}
