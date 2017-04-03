aws_route53domains_domain_contact_privacy_update() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws route53domains update-domain-contact-privacy --domain-name $domain_name "$@"
}
