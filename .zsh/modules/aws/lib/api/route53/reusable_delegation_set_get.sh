aws_route53_reusable_delegation_set_get() {
    local id="$1"
    shift 1

    log_and_run aws route53 get-reusable-delegation-set --id $id "$@"
}
