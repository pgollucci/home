aws_cloudformation_template_validate() {
    shift 0

    cond_log_and_run aws cloudformation  "@"

}
