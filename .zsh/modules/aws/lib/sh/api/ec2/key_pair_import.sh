aws_ec2_key_pair_import() {
    local key_name="$1"
    local public_key_material="$2"
    shift 2

    cond_log_and_run aws ec2 import-key-pair --key-name $key_name --public-key-material $public_key_material "$@"
}
