aws_waf_byte_match_sets_list() {
    shift 0

    log_and_run aws waf list-byte-match-sets "$@"
}
