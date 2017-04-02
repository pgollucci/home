aws_cloudsearch_scaling_parameters_describe() {
    local domain-name="$1"
    shift 1

    log_and_run aws cloudsearch  --domain-name $domain_name "@"

}
