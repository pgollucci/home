aws_shield_protection_delete() {
    local protection_id="$1"
    shift 1

    cond_log_and_run aws shield delete-protection --protection-id $protection_id "$@"
}
