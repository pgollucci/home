aws_shield_attacks_list() {
    shift 0

    log_and_run aws shield list-attacks "$@"
}
