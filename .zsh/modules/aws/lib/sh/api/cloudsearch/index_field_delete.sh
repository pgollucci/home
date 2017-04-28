aws_cloudsearch_index_field_delete() {
    local domain_name="$1"
    local index_field_name="$2"
    shift 2

    cond_log_and_run aws cloudsearch delete-index-field --domain-name $domain_name --index-field-name $index_field_name "$@"
}
