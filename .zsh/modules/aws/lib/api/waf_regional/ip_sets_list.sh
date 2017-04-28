aws_waf-regional_ip_sets_list() {

    log_and_run aws waf-regional list-ip-sets "$@"
}
