aws_deploy_get_on_premises_instances_batch() {
    shift 0

    log_and_run aws deploy batch-get-on-premises-instances "$@"
}
