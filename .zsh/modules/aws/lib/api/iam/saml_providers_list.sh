aws_iam_saml_providers_list() {

    log_and_run aws iam list-saml-providers "$@"
}
