aws_elasticache_cache_security_group_ingress_revoke() {
    local cache_security_group_name="$1"
    local ec2_security_group_name="$2"
    local ec2_security_group_owner_id="$3"
    shift 3

    cond_log_and_run aws elasticache revoke-cache-security-group-ingress --cache-security-group-name $cache_security_group_name --ec2-security-group-name $ec2_security_group_name --ec2-security-group-owner-id $ec2_security_group_owner_id "$@"
}
