aws_snowball_address_describe() {
    local address-id="$1"
    shift 1

    log_and_run aws snowball  --address-id $address_id "@"

}
