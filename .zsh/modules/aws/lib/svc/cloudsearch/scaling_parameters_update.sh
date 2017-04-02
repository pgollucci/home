aws_cloudsearch_scaling_parameters_update() {
    local scaling-parameters="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws cloudsearch  --scaling-parameters $scaling_parameters --domain-name $domain_name "@"

}
