aws_cloudformation_template_cost_estimate() {

    cond_log_and_run aws cloudformation estimate-template-cost "$@"
}
