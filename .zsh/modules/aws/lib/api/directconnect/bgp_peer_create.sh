aws_directconnect_bgp_peer_create() {
    shift 0

    cond_log_and_run aws directconnect create-bgp-peer "$@"
}
