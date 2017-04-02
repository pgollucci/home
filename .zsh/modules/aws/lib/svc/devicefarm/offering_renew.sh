aws_devicefarm_offering_renew() {
    shift 0

    cond_log_and_run aws devicefarm  "@"

}
