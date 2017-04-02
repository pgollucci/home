aws_cloudsearch_service_access_policies_describe() {
    local domain-name="$1"
    shift 1

    log_and_run aws cloudsearch  --domain-name $domain_name "@"

}
