aws_directconnect_connection_create() {
    local location="$1"
    local bandwidth="$2"
    local connection_name="$3"
    shift 3

    cond_log_and_run aws directconnect create-connection --location $location --bandwidth $bandwidth --connection-name $connection_name "$@"
}
