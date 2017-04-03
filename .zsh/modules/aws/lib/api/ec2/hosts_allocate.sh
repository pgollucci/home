aws_ec2_hosts_allocate() {
    local instance_type="$1"
    local quantity="$2"
    local availability_zone="$3"
    shift 3

    cond_log_and_run aws ec2 allocate-hosts --instance-type $instance_type --quantity $quantity --availability-zone $availability_zone "$@"
}
