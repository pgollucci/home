aws_cloudsearch_analysis_scheme_delete() {
    local domain_name="$1"
    local analysis_scheme_name="$2"
    shift 2

    cond_log_and_run aws cloudsearch delete-analysis-scheme --domain-name $domain_name --analysis-scheme-name $analysis_scheme_name "$@"
}
