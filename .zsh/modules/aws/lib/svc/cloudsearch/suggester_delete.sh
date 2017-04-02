aws_cloudsearch_suggester_delete() {
    local domain-name="$1"
    local suggester-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --domain-name $domain_name --suggester-name $suggester_name "@"

}
