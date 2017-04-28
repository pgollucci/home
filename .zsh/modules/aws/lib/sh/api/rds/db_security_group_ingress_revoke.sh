aws_rds_db_security_group_ingress_revoke() {
    local db_security_group_name="$1"
    shift 1

    cond_log_and_run aws rds revoke-db-security-group-ingress --db-security-group-name $db_security_group_name "$@"
}
