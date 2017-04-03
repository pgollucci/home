aws_cloudsearch_service_access_policies_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-service-access-policies --domain-name $domain_name "$@"
}
