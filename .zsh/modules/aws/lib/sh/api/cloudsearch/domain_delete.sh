aws_cloudsearch_domain_delete() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws cloudsearch delete-domain --domain-name $domain_name "$@"
}
