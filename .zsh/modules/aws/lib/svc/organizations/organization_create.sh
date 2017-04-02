aws_organizations_organization_create() {
    shift 0

    cond_log_and_run aws organizations  "@"

}
