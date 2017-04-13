aws_organizations_all_features_enable() {

    cond_log_and_run aws organizations enable-all-features "$@"
}
