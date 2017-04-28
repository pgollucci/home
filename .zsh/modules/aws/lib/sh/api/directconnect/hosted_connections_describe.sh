aws_directconnect_hosted_connections_describe() {
    local connection_id="$1"
    shift 1

    log_and_run aws directconnect describe-hosted-connections --connection-id $connection_id "$@"
}
