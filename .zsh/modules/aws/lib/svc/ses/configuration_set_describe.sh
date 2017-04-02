aws_ses_configuration_set_describe() {
    local configuration-set-name="$1"
    shift 1

    log_and_run aws ses  --configuration-set-name $configuration_set_name "@"

}
