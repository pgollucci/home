aws_cloudsearch_suggester_define() {
    local domain_name="$1"
    local suggester="$2"
    shift 2

    cond_log_and_run aws cloudsearch define-suggester --domain-name $domain_name --suggester $suggester "$@"
}
