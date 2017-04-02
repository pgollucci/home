aws_organizations_handshake_decline() {
    local handshake-id="$1"
    shift 1

    cond_log_and_run aws organizations  --handshake-id $handshake_id "@"

}
