aws_cloudsearch_service_access_policies_update() {
    local access-policies="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --access-policies $access_policies --domain-name $domain_name "@"

}
