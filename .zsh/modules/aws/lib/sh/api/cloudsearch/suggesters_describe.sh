aws_cloudsearch_suggesters_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-suggesters --domain-name $domain_name "$@"
}
