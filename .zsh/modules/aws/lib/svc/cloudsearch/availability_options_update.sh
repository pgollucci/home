aws_cloudsearch_availability_options_update() {
    local domain-name="$1"
    local multi-az="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --domain-name $domain_name --multi-az $multi_az "@"

}
