aws_directconnect_lag_create() {
    local number_of_connections="$1"
    local location="$2"
    local connections_bandwidth="$3"
    local lag_name="$4"
    shift 4

    cond_log_and_run aws directconnect create-lag --number-of-connections $number_of_connections --location $location --connections-bandwidth $connections_bandwidth --lag-name $lag_name "$@"
}
