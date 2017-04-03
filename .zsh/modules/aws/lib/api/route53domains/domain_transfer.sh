aws_route53domains_domain_transfer() {
    local domain_name="$1"
    local duration_in_years="$2"
    local admin_contact="$3"
    local registrant_contact="$4"
    local tech_contact="$5"
    shift 5

    cond_log_and_run aws route53domains transfer-domain --domain-name $domain_name --duration-in-years $duration_in_years --admin-contact $admin_contact --registrant-contact $registrant_contact --tech-contact $tech_contact "$@"
}
