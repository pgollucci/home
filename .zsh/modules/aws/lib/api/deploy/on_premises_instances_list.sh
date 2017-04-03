aws_deploy_on_premises_instances_list() {
    shift 0

    log_and_run aws deploy list-on-premises-instances "$@"
}
