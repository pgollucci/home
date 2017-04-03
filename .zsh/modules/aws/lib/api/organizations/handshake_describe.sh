aws_organizations_handshake_describe() {
    local handshake_id="$1"
    shift 1

    log_and_run aws organizations describe-handshake --handshake-id $handshake_id "$@"
}
