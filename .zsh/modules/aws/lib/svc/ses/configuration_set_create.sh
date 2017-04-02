aws_ses_configuration_set_create() {
    local configuration-set="$1"
    shift 1

    cond_log_and_run aws ses  --configuration-set $configuration_set "@"

}
