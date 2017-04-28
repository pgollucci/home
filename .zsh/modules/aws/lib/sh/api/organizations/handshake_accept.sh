aws_organizations_handshake_accept() {
    local handshake_id="$1"
    shift 1

    cond_log_and_run aws organizations accept-handshake --handshake-id $handshake_id "$@"
}
