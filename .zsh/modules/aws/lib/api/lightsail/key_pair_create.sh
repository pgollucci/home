aws_lightsail_key_pair_create() {
    local key_pair_name="$1"
    shift 1

    cond_log_and_run aws lightsail create-key-pair --key-pair-name $key_pair_name "$@"
}
