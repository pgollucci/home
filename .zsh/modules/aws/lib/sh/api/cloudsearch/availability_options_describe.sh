aws_cloudsearch_availability_options_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-availability-options --domain-name $domain_name "$@"
}
