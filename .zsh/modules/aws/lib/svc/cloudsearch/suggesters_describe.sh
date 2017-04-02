aws_cloudsearch_suggesters_describe() {
    local domain-name="$1"
    shift 1

    log_and_run aws cloudsearch  --domain-name $domain_name "@"

}
