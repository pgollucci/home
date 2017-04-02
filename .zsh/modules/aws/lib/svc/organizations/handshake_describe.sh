aws_organizations_handshake_describe() {
    local handshake-id="$1"
    shift 1

    log_and_run aws organizations  --handshake-id $handshake_id "@"

}
