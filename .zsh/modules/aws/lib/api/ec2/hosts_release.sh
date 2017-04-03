aws_ec2_hosts_release() {
    local host_ids="$1"
    shift 1

    cond_log_and_run aws ec2 release-hosts --host-ids $host_ids "$@"
}
