aws_ec2_vpc_classic_link_dns_support_enable() {

    cond_log_and_run aws ec2 enable-vpc-classic-link-dns-support "$@"
}
