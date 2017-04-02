aws_opsworks_rds_db_instances_describe() {
    local stack-id="$1"
    shift 1

    log_and_run aws opsworks  --stack-id $stack_id "@"

}
