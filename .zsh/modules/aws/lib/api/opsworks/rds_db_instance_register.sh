aws_opsworks_rds_db_instance_register() {
    local stack_id="$1"
    local rds_db_instance_arn="$2"
    local db_user="$3"
    local db_password="$4"
    shift 4

    cond_log_and_run aws opsworks register-rds-db-instance --stack-id $stack_id --rds-db-instance-arn $rds_db_instance_arn --db-user $db_user --db-password $db_password "$@"
}
