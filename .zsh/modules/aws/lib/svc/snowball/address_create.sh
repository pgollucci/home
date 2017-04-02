aws_snowball_address_create() {
    local address="$1"
    shift 1

    cond_log_and_run aws snowball  --address $address "@"

}
