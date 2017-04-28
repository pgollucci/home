aws_ec2_vpc_classic_link_disable() {
    local vpc_id="$1"
    shift 1

    cond_log_and_run aws ec2 disable-vpc-classic-link --vpc-id $vpc_id "$@"
}
