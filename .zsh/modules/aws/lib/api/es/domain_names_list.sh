aws_es_domain_names_list() {
    shift 0

    log_and_run aws es list-domain-names "$@"
}
