aws_route53domains_contact_reachability_email_resend() {

    cond_log_and_run aws route53domains resend-contact-reachability-email "$@"
}
