aws_cloudsearch_documents_index() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws cloudsearch index-documents --domain-name $domain_name "$@"
}
