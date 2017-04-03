aws_redshift_hsm_configurations_describe() {
    shift 0

    log_and_run aws redshift describe-hsm-configurations "$@"
}
