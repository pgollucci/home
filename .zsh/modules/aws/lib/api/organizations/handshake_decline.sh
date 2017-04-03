aws_organizations_handshake_decline() {
    local handshake_id="$1"
    shift 1

    cond_log_and_run aws organizations decline-handshake --handshake-id $handshake_id "$@"
}
