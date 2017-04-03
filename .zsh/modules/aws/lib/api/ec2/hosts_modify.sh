aws_ec2_hosts_modify() {
    local host_ids="$1"
    local auto_placement="$2"
    shift 2

    cond_log_and_run aws ec2 modify-hosts --host-ids $host_ids --auto-placement $auto_placement "$@"
}
