aws_route53_reusable_delegation_set_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws route53 delete-reusable-delegation-set --id $id "$@"
}
