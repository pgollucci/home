aws_cloudsearch_expression_delete() {
    local expression-name="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --expression-name $expression_name --domain-name $domain_name "@"

}
