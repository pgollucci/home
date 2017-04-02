aws_cloudsearch_index_field_delete() {
    local index-field-name="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --index-field-name $index_field_name --domain-name $domain_name "@"

}
