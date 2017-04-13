aws_acm_certificates_list() {

    log_and_run aws acm list-certificates "$@"
}
