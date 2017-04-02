aws_cloudsearch_expression_define() {
    local expression="$1"
    local name="$2"
    local domain-name="$3"
    shift 3

    cond_log_and_run aws cloudsearch  --expression $expression --name $name --domain-name $domain_name "@"

}
