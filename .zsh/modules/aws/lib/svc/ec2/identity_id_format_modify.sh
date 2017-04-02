aws_ec2_identity_id_format_modify() {
    local resource="$1"
    local use-long-ids="$2"
    local principal-arn="$3"
    shift 3

    cond_log_and_run aws ec2  --resource $resource --use-long-ids $use_long_ids --principal-arn $principal_arn "@"

}
