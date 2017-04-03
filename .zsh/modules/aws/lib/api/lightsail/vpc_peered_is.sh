aws_lightsail_vpc_peered_is() {
    shift 0

    cond_log_and_run aws lightsail is-vpc-peered "$@"
}
