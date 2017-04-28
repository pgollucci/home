aws_ec2_key_pair_create() {
    local key_name="$1"
    shift 1

    cond_log_and_run aws ec2 create-key-pair --key-name $key_name "$@"
}
