aws_cloudsearch_analysis_scheme_define() {
    local domain_name="$1"
    local analysis_scheme="$2"
    shift 2

    cond_log_and_run aws cloudsearch define-analysis-scheme --domain-name $domain_name --analysis-scheme $analysis_scheme "$@"
}
