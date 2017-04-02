aws_rds_reserved_db_instances_offering_purchase() {
    local reserved-db-instances-offering-id="$1"
    shift 1

    cond_log_and_run aws rds  --reserved-db-instances-offering-id $reserved_db_instances_offering_id "@"

}
