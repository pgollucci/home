aws_ec2_identity_id_format_modify() {
    local principal_arn="$1"
    local resource="$2"
    local use_long_ids="$3"
    shift 3

    cond_log_and_run aws ec2 modify-identity-id-format --principal-arn $principal_arn --resource $resource --use-long-ids $use_long_ids "$@"
}
