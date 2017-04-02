aws_directconnect_connection_create() {
    local connection-name="$1"
    local bandwidth="$2"
    local location="$3"
    shift 3

    cond_log_and_run aws directconnect  --connection-name $connection_name --bandwidth $bandwidth --location $location "@"

}
