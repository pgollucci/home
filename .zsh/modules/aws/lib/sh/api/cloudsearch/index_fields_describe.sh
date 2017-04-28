aws_cloudsearch_index_fields_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-index-fields --domain-name $domain_name "$@"
}
