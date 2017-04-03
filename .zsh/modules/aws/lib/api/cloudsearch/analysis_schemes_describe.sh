aws_cloudsearch_analysis_schemes_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-analysis-schemes --domain-name $domain_name "$@"
}
