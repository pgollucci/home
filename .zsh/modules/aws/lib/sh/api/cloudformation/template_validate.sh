aws_cloudformation_template_validate() {

    cond_log_and_run aws cloudformation validate-template "$@"
}
