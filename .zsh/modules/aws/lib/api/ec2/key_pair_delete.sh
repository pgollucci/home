aws_ec2_key_pair_delete() {
    local key_name="$1"
    shift 1

    cond_log_and_run aws ec2 delete-key-pair --key-name $key_name "$@"
}
