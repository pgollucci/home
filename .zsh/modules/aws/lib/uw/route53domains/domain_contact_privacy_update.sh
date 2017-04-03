aws_route53domains_privacy() {
        local domain_name="$1"
        shift 1

    cond_log_and_run aws route53domains update-domain-contact-privacy --domain-name $domain_name --admin-privacy "$@"
}

aws_route53domains_privacy() {
        local domain_name="$1"
        shift 1

    cond_log_and_run aws route53domains update-domain-contact-privacy --domain-name $domain_name --registrant-privacy "$@"
}

aws_route53domains_privacy() {
        local domain_name="$1"
        shift 1

    cond_log_and_run aws route53domains update-domain-contact-privacy --domain-name $domain_name --tech-privacy "$@"
}

