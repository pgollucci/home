aws_organizations_organization_leave() {

    cond_log_and_run aws organizations leave-organization "$@"
}
