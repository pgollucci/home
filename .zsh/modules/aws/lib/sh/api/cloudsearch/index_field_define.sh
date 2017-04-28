aws_cloudsearch_index_field_define() {
    local domain_name="$1"
    local name="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws cloudsearch define-index-field --domain-name $domain_name --name $name --type $type "$@"
}
