aws_lightsail_key_pair_get() {
    local key-pair-name="$1"
    shift 1

    log_and_run aws lightsail  --key-pair-name $key_pair_name "@"

}
