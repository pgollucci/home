aws_rds_db_security_group_create() {
    local db_security_group_name="$1"
    local db_security_group_description="$2"
    shift 2

    cond_log_and_run aws rds create-db-security-group --db-security-group-name $db_security_group_name --db-security-group-description $db_security_group_description "$@"
}
