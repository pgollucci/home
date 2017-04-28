aws_directconnect_interconnect_create() {
    local interconnect_name="$1"
    local bandwidth="$2"
    local location="$3"
    shift 3

    cond_log_and_run aws directconnect create-interconnect --interconnect-name $interconnect_name --bandwidth $bandwidth --location $location "$@"
}
