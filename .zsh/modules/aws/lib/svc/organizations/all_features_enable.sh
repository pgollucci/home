aws_organizations_all_features_enable() {
    shift 0

    cond_log_and_run aws organizations  "@"

}
