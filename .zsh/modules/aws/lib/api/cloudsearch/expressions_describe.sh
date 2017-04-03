aws_cloudsearch_expressions_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-expressions --domain-name $domain_name "$@"
}
