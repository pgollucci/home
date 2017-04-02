aws_route53domains_contact_reachability_email_resend() {
    shift 0

    cond_log_and_run aws route53domains  "@"

}
