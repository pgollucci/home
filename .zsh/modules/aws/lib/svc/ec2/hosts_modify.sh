aws_ec2_hosts_modify() {
    local auto-placement="$1"
    local host-ids="$2"
    shift 2

    cond_log_and_run aws ec2  --auto-placement $auto_placement --host-ids $host_ids "@"

}
