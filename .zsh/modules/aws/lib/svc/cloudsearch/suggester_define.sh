aws_cloudsearch_suggester_define() {
    local suggester="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --suggester $suggester --domain-name $domain_name "@"

}
