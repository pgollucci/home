aws_waf_xss_match_sets_list() {
    shift 0

    log_and_run aws waf list-xss-match-sets "$@"
}
