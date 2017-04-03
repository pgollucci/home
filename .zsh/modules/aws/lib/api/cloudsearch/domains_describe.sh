aws_cloudsearch_domains_describe() {
    shift 0

    log_and_run aws cloudsearch describe-domains "$@"
}
