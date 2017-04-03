aws_cloudformation_template_cost_estimate() {
    shift 0

    cond_log_and_run aws cloudformation estimate-template-cost "$@"
}
