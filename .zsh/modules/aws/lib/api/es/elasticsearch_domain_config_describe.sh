aws_es_elasticsearch_domain_config_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws es describe-elasticsearch-domain-config --domain-name $domain_name "$@"
}
