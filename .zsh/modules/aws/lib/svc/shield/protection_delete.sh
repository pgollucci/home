aws_shield_protection_delete() {
    local protection-id="$1"
    shift 1

    cond_log_and_run aws shield  --protection-id $protection_id "@"

}
