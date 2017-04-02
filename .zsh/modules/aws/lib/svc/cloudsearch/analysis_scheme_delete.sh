aws_cloudsearch_analysis_scheme_delete() {
    local analysis-scheme-name="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --analysis-scheme-name $analysis_scheme_name --domain-name $domain_name "@"

}
