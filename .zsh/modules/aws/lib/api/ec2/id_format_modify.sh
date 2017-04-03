aws_ec2_id_format_modify() {
    local resource="$1"
    local use_long_ids="$2"
    shift 2

    cond_log_and_run aws ec2 modify-id-format --resource $resource --use-long-ids $use_long_ids "$@"
}
