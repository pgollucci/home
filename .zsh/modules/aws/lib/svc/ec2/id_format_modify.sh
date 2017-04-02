aws_ec2_id_format_modify() {
    local use-long-ids="$1"
    local resource="$2"
    shift 2

    cond_log_and_run aws ec2  --use-long-ids $use_long_ids --resource $resource "@"

}
