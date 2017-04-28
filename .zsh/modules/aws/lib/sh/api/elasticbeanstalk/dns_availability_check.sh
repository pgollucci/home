aws_elasticbeanstalk_dns_availability_check() {
    local cname_prefix="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk check-dns-availability --cname-prefix $cname_prefix "$@"
}
