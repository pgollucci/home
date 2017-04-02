aws_ses_configuration_set_delete() {
    local configuration-set-name="$1"
    shift 1

    cond_log_and_run aws ses  --configuration-set-name $configuration_set_name "@"

}
