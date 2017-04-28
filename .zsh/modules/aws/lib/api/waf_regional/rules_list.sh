aws_waf_regional_rules_list() {

    log_and_run aws waf-regional list-rules "$@"
}
