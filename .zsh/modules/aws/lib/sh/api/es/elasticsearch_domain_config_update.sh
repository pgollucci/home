aws_es_elasticsearch_domain_config_update() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws es update-elasticsearch-domain-config --domain-name $domain_name "$@"
}
