aws_ec2_network_interface_detach() {
    local attachment-id="$1"
    shift 1

    cond_log_and_run aws ec2  --attachment-id $attachment_id "@"

}
