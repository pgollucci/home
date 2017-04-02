aws_iam_saml_provider_get() {
    local saml-provider-arn="$1"
    shift 1

    log_and_run aws iam  --saml-provider-arn $saml_provider_arn "@"

}
