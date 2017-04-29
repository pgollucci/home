aws_rds_db_auth_token_generate() {
    local hostname="$1"
    local port="$2"
    local username="$3"
    shift 3

    cond_log_and_run aws rds generate-db-auth-token --hostname $hostname --port $port --username $username "$@"
}
