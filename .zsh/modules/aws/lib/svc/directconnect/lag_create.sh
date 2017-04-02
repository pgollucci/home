aws_directconnect_lag_create() {
    local location="$1"
    local connections-bandwidth="$2"
    local lag-name="$3"
    local number-of-connections="$4"
    shift 4

    cond_log_and_run aws directconnect  --location $location --connections-bandwidth $connections_bandwidth --lag-name $lag_name --number-of-connections $number_of_connections "@"

}
