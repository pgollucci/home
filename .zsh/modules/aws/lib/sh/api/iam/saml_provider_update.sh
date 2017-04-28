aws_iam_saml_provider_update() {
    local saml_metadata_document="$1"
    local saml_provider_arn="$2"
    shift 2

    cond_log_and_run aws iam update-saml-provider --saml-metadata-document $saml_metadata_document --saml-provider-arn $saml_provider_arn "$@"
}
