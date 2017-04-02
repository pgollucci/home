aws_ec2_key_pair_import() {
    local key-name="$1"
    local public-key-material="$2"
    shift 2

    cond_log_and_run aws ec2  --key-name $key_name --public-key-material $public_key_material "@"

}
