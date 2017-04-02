aws_es_elasticsearch_domain_delete() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws es  --domain-name $domain_name "@"

}
