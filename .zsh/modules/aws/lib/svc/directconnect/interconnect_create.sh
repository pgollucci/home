aws_directconnect_interconnect_create() {
    local location="$1"
    local bandwidth="$2"
    local interconnect-name="$3"
    shift 3

    cond_log_and_run aws directconnect  --location $location --bandwidth $bandwidth --interconnect-name $interconnect_name "@"

}
