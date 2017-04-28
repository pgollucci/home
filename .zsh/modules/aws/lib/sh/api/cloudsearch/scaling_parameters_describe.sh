aws_cloudsearch_scaling_parameters_describe() {
    local domain_name="$1"
    shift 1

    log_and_run aws cloudsearch describe-scaling-parameters --domain-name $domain_name "$@"
}
