aws_devicefarm_account_settings_get() {
    shift 0

    log_and_run aws devicefarm get-account-settings "$@"
}
