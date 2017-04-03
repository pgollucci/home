aws_cloudsearch_domain_create() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws cloudsearch create-domain --domain-name $domain_name "$@"
}
