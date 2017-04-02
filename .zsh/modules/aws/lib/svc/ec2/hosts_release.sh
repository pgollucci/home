aws_ec2_hosts_release() {
    local host-ids="$1"
    shift 1

    cond_log_and_run aws ec2  --host-ids $host_ids "@"

}
