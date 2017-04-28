aws_cloudsearch_service_access_policies_update() {
    local domain_name="$1"
    local access_policies="$2"
    shift 2

    cond_log_and_run aws cloudsearch update-service-access-policies --domain-name $domain_name --access-policies $access_policies "$@"
}
