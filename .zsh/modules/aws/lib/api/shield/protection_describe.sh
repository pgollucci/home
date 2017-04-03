aws_shield_protection_describe() {
    local protection_id="$1"
    shift 1

    log_and_run aws shield describe-protection --protection-id $protection_id "$@"
}
