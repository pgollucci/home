aws_ec2_key_pair_create() {
    local key-name="$1"
    shift 1

    cond_log_and_run aws ec2  --key-name $key_name "@"

}
