aws_ec2_hosts_allocate() {
    local availability_zone="$1"
    local instance_type="$2"
    local quantity="$3"
    shift 3

    cond_log_and_run aws ec2 allocate-hosts --availability-zone $availability_zone --instance-type $instance_type --quantity $quantity "$@"
}
