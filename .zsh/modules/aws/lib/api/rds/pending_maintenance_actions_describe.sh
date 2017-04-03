aws_rds_pending_maintenance_actions_describe() {
    shift 0

    log_and_run aws rds describe-pending-maintenance-actions "$@"
}
