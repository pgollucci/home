aws_ses_configuration_set_describe() {
    local configuration_set_name="$1"
    shift 1

    log_and_run aws ses describe-configuration-set --configuration-set-name $configuration_set_name "$@"
}
