aws_waf_regional_web_acls_list() {

    log_and_run aws waf-regional list-web-acls "$@"
}
