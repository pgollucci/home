aws_route53domains_tags_for_domain_delete() {
    local tags-to-delete="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws route53domains  --tags-to-delete $tags_to_delete --domain-name $domain_name "@"

}
