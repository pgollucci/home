aws_ec2_vpc_classic_link_dns_support_describe() {
    shift 0

    log_and_run aws ec2 describe-vpc-classic-link-dns-support "$@"
}
