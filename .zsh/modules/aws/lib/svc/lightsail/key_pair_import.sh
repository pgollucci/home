aws_lightsail_key_pair_import() {
    local public-key-base-64="$1"
    local key-pair-name="$2"
    shift 2

    cond_log_and_run aws lightsail  --public-key-base-64 $public_key_base_64 --key-pair-name $key_pair_name "@"

}
