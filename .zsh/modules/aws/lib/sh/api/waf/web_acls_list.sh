aws_waf_web_acls_list() {

    log_and_run aws waf list-web-acls "$@"
}
