aws_route53domains_domain_auth_code_retrieve() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws route53domains retrieve-domain-auth-code --domain-name $domain_name "$@"
}
