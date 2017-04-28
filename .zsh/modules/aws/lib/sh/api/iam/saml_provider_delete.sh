aws_iam_saml_provider_delete() {
    local saml_provider_arn="$1"
    shift 1

    cond_log_and_run aws iam delete-saml-provider --saml-provider-arn $saml_provider_arn "$@"
}
