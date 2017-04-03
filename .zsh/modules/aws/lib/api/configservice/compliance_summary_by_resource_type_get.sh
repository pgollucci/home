aws_configservice_compliance_summary_by_resource_type_get() {
    shift 0

    log_and_run aws configservice get-compliance-summary-by-resource-type "$@"
}
