aws_ec2_vpc_classic_link_enable() {
    local vpc_id="$1"
    shift 1

    cond_log_and_run aws ec2 enable-vpc-classic-link --vpc-id $vpc_id "$@"
}
