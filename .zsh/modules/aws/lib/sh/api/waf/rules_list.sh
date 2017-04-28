aws_waf_rules_list() {

    log_and_run aws waf list-rules "$@"
}
