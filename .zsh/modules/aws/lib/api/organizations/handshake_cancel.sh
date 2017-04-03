aws_organizations_handshake_cancel() {
    local handshake_id="$1"
    shift 1

    cond_log_and_run aws organizations cancel-handshake --handshake-id $handshake_id "$@"
}
