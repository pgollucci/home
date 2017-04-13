aws_organizations_organization_delete() {

    cond_log_and_run aws organizations delete-organization "$@"
}
