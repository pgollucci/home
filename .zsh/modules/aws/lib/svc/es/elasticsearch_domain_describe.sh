aws_es_elasticsearch_domain_describe() {
    local domain-name="$1"
    shift 1

    log_and_run aws es  --domain-name $domain_name "@"

}
