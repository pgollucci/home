aws_cloudsearch_domain_delete() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws cloudsearch  --domain-name $domain_name "@"

}
