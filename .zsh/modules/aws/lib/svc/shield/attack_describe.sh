aws_shield_attack_describe() {
    local attack-id="$1"
    shift 1

    log_and_run aws shield  --attack-id $attack_id "@"

}
