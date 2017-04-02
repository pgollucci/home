aws_rds_db_security_group_delete() {
    local db-security-group-name="$1"
    shift 1

    cond_log_and_run aws rds  --db-security-group-name $db_security_group_name "@"

}
