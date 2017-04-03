aws_waf-regional_web_acls_list() {
    shift 0

    log_and_run aws waf-regional list-web-acls "$@"
}
