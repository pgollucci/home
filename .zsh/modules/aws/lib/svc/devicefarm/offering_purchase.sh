aws_devicefarm_offering_purchase() {
    shift 0

    cond_log_and_run aws devicefarm  "@"

}
