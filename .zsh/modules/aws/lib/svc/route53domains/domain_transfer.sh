aws_route53domains_domain_transfer() {
    local tech-contact="$1"
    local duration-in-years="$2"
    local admin-contact="$3"
    local registrant-contact="$4"
    local domain-name="$5"
    shift 5

    cond_log_and_run aws route53domains  --tech-contact $tech_contact --duration-in-years $duration_in_years --admin-contact $admin_contact --registrant-contact $registrant_contact --domain-name $domain_name "@"

}
