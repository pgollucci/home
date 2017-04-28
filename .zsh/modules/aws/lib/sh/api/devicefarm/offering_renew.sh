aws_devicefarm_offering_renew() {

    cond_log_and_run aws devicefarm renew-offering "$@"
}
