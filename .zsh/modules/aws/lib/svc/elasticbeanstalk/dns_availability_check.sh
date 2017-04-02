aws_elasticbeanstalk_dns_availability_check() {
    local cname-prefix="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk  --cname-prefix $cname_prefix "@"

}
