aws_waf_rules_list() {
    shift 0

    log_and_run aws waf list-rules "$@"
}
