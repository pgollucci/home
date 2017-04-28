aws_cloudsearch_suggesters_build() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws cloudsearch build-suggesters --domain-name $domain_name "$@"
}
