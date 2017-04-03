aws_lightsail_key_pair_get() {
    local key_pair_name="$1"
    shift 1

    log_and_run aws lightsail get-key-pair --key-pair-name $key_pair_name "$@"
}
