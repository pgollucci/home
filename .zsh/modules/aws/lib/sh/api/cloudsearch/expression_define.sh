aws_cloudsearch_expression_define() {
    local domain_name="$1"
    local expression="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws cloudsearch define-expression --domain-name $domain_name --expression $expression --name $name "$@"
}
