aws_opsworks_rds_db_instance_deregister() {
    local rds-db-instance-arn="$1"
    shift 1

    cond_log_and_run aws opsworks  --rds-db-instance-arn $rds_db_instance_arn "@"

}
