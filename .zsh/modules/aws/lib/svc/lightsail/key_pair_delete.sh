aws_lightsail_key_pair_delete() {
    local key-pair-name="$1"
    shift 1

    cond_log_and_run aws lightsail  --key-pair-name $key_pair_name "@"

}
