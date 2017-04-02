aws_cloudsearch_analysis_scheme_define() {
    local analysis-scheme="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --analysis-scheme $analysis_scheme --domain-name $domain_name "@"

}
