aws_support_trusted_advisor_checks_describe() {
    local language="$1"
    shift 1

    log_and_run aws support  --language $language "@"

}
