aws_ec2_hosts_allocate() {
    local instance-type="$1"
    local quantity="$2"
    local availability-zone="$3"
    shift 3

    cond_log_and_run aws ec2  --instance-type $instance_type --quantity $quantity --availability-zone $availability_zone "@"

}
