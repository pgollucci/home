aws_cloudsearch_expression_delete() {
    local domain_name="$1"
    local expression_name="$2"
    shift 2

    cond_log_and_run aws cloudsearch delete-expression --domain-name $domain_name --expression-name $expression_name "$@"
}
