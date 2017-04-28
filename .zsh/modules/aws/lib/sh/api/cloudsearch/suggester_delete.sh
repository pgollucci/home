aws_cloudsearch_suggester_delete() {
    local domain_name="$1"
    local suggester_name="$2"
    shift 2

    cond_log_and_run aws cloudsearch delete-suggester --domain-name $domain_name --suggester-name $suggester_name "$@"
}
