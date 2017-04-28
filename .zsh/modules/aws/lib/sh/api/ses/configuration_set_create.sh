aws_ses_configuration_set_create() {
    local configuration_set="$1"
    shift 1

    cond_log_and_run aws ses create-configuration-set --configuration-set $configuration_set "$@"
}
