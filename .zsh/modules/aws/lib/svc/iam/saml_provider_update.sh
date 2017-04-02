aws_iam_saml_provider_update() {
    local saml-provider-arn="$1"
    local saml-metadata-document="$2"
    shift 2

    cond_log_and_run aws iam  --saml-provider-arn $saml_provider_arn --saml-metadata-document $saml_metadata_document "@"

}
