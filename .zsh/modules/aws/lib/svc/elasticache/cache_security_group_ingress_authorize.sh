aws_elasticache_cache_security_group_ingress_authorize() {
    local cache-security-group-name="$1"
    local ec2-security-group-owner-id="$2"
    local ec2-security-group-name="$3"
    shift 3

    cond_log_and_run aws elasticache  --cache-security-group-name $cache_security_group_name --ec2-security-group-owner-id $ec2_security_group_owner_id --ec2-security-group-name $ec2_security_group_name "@"

}
