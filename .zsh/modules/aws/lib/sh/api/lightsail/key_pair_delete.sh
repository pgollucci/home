aws_lightsail_key_pair_delete() {
    local key_pair_name="$1"
    shift 1

    cond_log_and_run aws lightsail delete-key-pair --key-pair-name $key_pair_name "$@"
}
