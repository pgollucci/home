aws_sts_role_with_saml_assume() {
    local saml-assertion="$1"
    local principal-arn="$2"
    local role-arn="$3"
    shift 3

    cond_log_and_run aws sts  --saml-assertion $saml_assertion --principal-arn $principal_arn --role-arn $role_arn "@"

}
