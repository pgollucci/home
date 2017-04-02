aws_es_elasticsearch_domains_describe() {
    local domain-names="$1"
    shift 1

    log_and_run aws es  --domain-names $domain_names "@"

}
