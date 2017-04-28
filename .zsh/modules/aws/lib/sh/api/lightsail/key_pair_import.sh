aws_lightsail_key_pair_import() {
    local key_pair_name="$1"
    local public_key_base_64="$2"
    shift 2

    cond_log_and_run aws lightsail import-key-pair --key-pair-name $key_pair_name --public-key-base-64 $public_key_base_64 "$@"
}
