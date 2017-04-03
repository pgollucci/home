aws_cloudsearch_domain_names_list() {
    shift 0

    log_and_run aws cloudsearch list-domain-names "$@"
}
