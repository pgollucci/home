aws_ec2_vpc_classic_link_dns_support_disable() {
    shift 0

    cond_log_and_run aws ec2 disable-vpc-classic-link-dns-support "$@"
}
