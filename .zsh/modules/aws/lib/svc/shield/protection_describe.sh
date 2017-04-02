aws_shield_protection_describe() {
    local protection-id="$1"
    shift 1

    log_and_run aws shield  --protection-id $protection_id "@"

}
