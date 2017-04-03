aws_lightsail_vpc_peer() {
    shift 0

    cond_log_and_run aws lightsail peer-vpc "$@"
}
