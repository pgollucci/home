aws_opsworks_rds_db_instance_register() {
    local db-user="$1"
    local stack-id="$2"
    local rds-db-instance-arn="$3"
    local db-password="$4"
    shift 4

    cond_log_and_run aws opsworks  --db-user $db_user --stack-id $stack_id --rds-db-instance-arn $rds_db_instance_arn --db-password $db_password "@"

}
